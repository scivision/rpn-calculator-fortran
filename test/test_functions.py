#!/usr/bin/env python3

from pathlib import Path
import subprocess

import scipy.special as sp
from pytest import approx
import pytest


@pytest.fixture()
def check_exe(exe):
    """Check if the executable is provided as a command line argument."""

    exe_path = Path(exe)
    if not exe_path.is_file():
        raise FileNotFoundError(f"Executable {exe_path} does not exist.")

    return exe_path


def frun(name: str, args, exe: Path) -> float:
    """Runs a command and returns its output"""
    if not isinstance(args, (list, tuple)):
        args = [args]
    input = "\n".join(map(str, args)) + "\n" + name + "\n"

    raw = subprocess.check_output([exe], input=input, text=True, timeout=5)

    return float(raw.strip().split("\n")[-1])


def test_bessel0(check_exe):

    fcns = {"besselj0": sp.jv, "bessely0": sp.yn, "besseli0": sp.iv, "besselk0": sp.kn}
    args = [3, 1]

    for k, f in fcns.items():
        for a in args:
            assert frun(k, a, check_exe) == approx(f(0, a))


def test_bessel1(check_exe):

    fcns = {"besselj1": sp.jv, "bessely1": sp.yn, "besseli1": sp.iv, "besselk1": sp.kn}
    args = [3, 1]

    for k, f in fcns.items():
        for a in args:
            assert frun(k, a, check_exe) == approx(f(1, a))


def test_bessel_general(check_exe):

    fcns = {"besselj": sp.jv, "bessely": sp.yv, "besseli": sp.iv, "besselk": sp.kv}
    args = [(2, 3), (5, 1)]

    for k, f in fcns.items():
        for a in args:
            assert frun(k, a, check_exe) == approx(f(*a))


def test_riemann_zeta(check_exe):

    assert frun("rzeta", (2), check_exe) == approx(sp.zeta(2))
