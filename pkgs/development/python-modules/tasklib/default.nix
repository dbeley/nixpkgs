{ lib, pythonPackages, taskwarrior, writeShellScriptBin }:

with pythonPackages;

let

wsl_stub = writeShellScriptBin "wsl" "true";

in buildPythonPackage rec {
  pname = "tasklib";
  version = "2.5.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-XM1zG1JjbdEEV6i42FjLDQJv+qsePnUbr3kb+APjfXs=";
  };

  propagatedBuildInputs = [
    six
    pytz
    tzlocal
  ];

  checkInputs = [
    taskwarrior
    wsl_stub
  ];

  meta = with lib; {
    homepage = "https://github.com/robgolding/tasklib";
    description = "A library for interacting with taskwarrior databases";
    maintainers = with maintainers; [ arcnmx ];
    platforms = platforms.all;
    license = licenses.bsd3;
  };
}
