import platform


class Platform:
    def __init__(self, *, system: str, machine: str, exe: str):
        self.system = system
        '''OS name as used in tool release URLs: "windows", "linux", or "macos"'''
        self.machine = machine
        '''Architecture as used in tool release URLs: "x86_64", "aarch64", or "arm64"'''
        self.exe = exe
        '''Executable file extension: ".exe" for Windows, "" otherwise'''


def get_platform() -> Platform | None:
    exe = ""
    system = platform.system()
    if system == "Windows":
        system = "windows"
        exe = ".exe"
    elif system == "Linux":
        system = "linux"
    elif system == "Darwin":
        system = "macos"
    else:
        print(f"Unknown system '{system}'")
        return None

    raw_machine = platform.machine().lower()
    match raw_machine:
        case "amd64" | "x86_64":
            machine = "x86_64"
        case "arm64":
            machine = "arm64"
        case "aarch64":
            # objdiff-cli uses "aarch64" on Linux but "arm64" on macOS;
            # dsd only ships "arm64" macOS binaries (no Linux arm builds).
            machine = "arm64" if system == "macos" else "aarch64"
        case _:
            print(f"Unknown machine: {raw_machine}")
            return None

    return Platform(system=system, machine=machine, exe=exe)


def exe_launch_prefix() -> list[str]:
    """Launcher prefix for the Win32 `mwccarm.exe` / `mwasmarm.exe` tools.

    Windows runs the PE binaries natively (the ninja build already does), so no
    runner is needed. Everywhere else they go through `wine` (Linux/macOS) — the
    same convention `configure.py` uses for the build. Reuses `get_platform()`
    so there is a single source of truth for the host OS.
    """
    p = get_platform()
    if p is not None and p.system == "windows":
        return []
    return ["wine"]
