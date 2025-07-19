import pytest


def pytest_addoption(parser):
    parser.addoption(
        "--exe", action="store", help="rpncalc executable"
    )


@pytest.fixture
def exe(request):
    return request.config.getoption("--exe")
