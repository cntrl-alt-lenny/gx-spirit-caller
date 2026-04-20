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
