# Windows build speed: Defender exclusions

This guide describes optional Windows Defender exclusions for the local
`gx-spirit-caller` build tree. They can reduce repeated real-time scanning of
short-lived compiler, object, and build files and may make long builds faster.
The trade-off is that files under the excluded path, and optionally the named
processes, receive less real-time inspection. Use these settings only if you
trust the checkout and understand that `python.exe` would apply broadly to
Python processes on the machine. Nothing below is run automatically.

## User choice: run in an ADMIN PowerShell

Every command below is an example for the user to review and run manually in
an elevated PowerShell. Do not run these commands as part of a build script.

### Inspect current exclusions (read-only)

```powershell
Get-MpPreference | Select-Object -ExpandProperty ExclusionPath
Get-MpPreference | Select-Object -ExpandProperty ExclusionProcess
```

### Add the repository path exclusion

```powershell
Add-MpPreference -ExclusionPath 'C:\Users\leona\Dev\gx-spirit-caller'
```

This covers the repository and its build-tree descendants. If a narrower
checkout or build directory is preferable, review the layout and substitute
that path before running the command.

### Add compiler/process exclusions (optional)

The core process exclusions cover the ARM compiler, linker, and Ninja:

```powershell
Add-MpPreference -ExclusionProcess 'mwccarm.exe','mwldarm.exe','ninja.exe'
```

Excluding `python.exe` is broad: it affects Python processes beyond this
project. Add it only if you deliberately accept that wider security trade-off:

```powershell
# Optional and broad; review before running.
Add-MpPreference -ExclusionProcess 'python.exe'
```

Together, the optional process set is `mwccarm.exe`, `mwldarm.exe`,
`ninja.exe`, and `python.exe`.

If you intentionally want to add all four in one command, use this equivalent
form; it includes the same broad `python.exe` trade-off:

```powershell
Add-MpPreference -ExclusionProcess 'mwccarm.exe','mwldarm.exe','ninja.exe','python.exe'
```

### Verify

Run the read-only queries again and confirm that the path and only the process
names you intended to add are present:

```powershell
Get-MpPreference | Select-Object -ExpandProperty ExclusionPath
Get-MpPreference | Select-Object -ExpandProperty ExclusionProcess
```

### Reverse the exclusions

Run these individually only for exclusions you added. First compare them with
the pre-change lists: removing an entry that was already present could undo a
separate configuration choice.

```powershell
Remove-MpPreference -ExclusionPath 'C:\Users\leona\Dev\gx-spirit-caller'

Remove-MpPreference -ExclusionProcess 'mwccarm.exe'
Remove-MpPreference -ExclusionProcess 'mwldarm.exe'
Remove-MpPreference -ExclusionProcess 'ninja.exe'
Remove-MpPreference -ExclusionProcess 'python.exe'
```

Afterward, verify the current state with the same `Get-MpPreference` commands.
The process exclusions are by executable name and can affect matching
processes outside this repository.
