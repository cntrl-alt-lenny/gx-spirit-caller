### cloud/windows-build-shell-fix

**Goal:** Make `ninja rom` work end-to-end on Windows hosts.
`tools/configure.py` already knows about Windows's `&&`-doesn't-
work issue and guards against it for the `mwcc` rule family
(lines 407, 426, 447 all check `if platform.system != "windows":`
before appending the `&& transform_dep.py` chain). But three
other rules — `delink`, `lcf`, and `mwasm` — chain commands
with `&&` unconditionally. On Windows, Ninja calls
`CreateProcess` directly without a shell, so `&&` lands as a
literal argument to `dsd.exe` / `mwasmarm.exe` and the build
dies on step 3 of 1472.

**Context:**

Fresh `brain` session, Windows host, `ninja rom` from a clean
checkout (post-PR-#391, on `main`):

```
[3/1472] .\dsd.exe delink --config-path config\eur\arm9\config.yaml
  && C:\...\python.exe tools/patch_section_align.py --dir build\eur\delinks
FAILED: [code=2] build/eur/delinks/delink.yaml
.\dsd.exe delink --config-path config\eur\arm9\config.yaml
  && C:\...\python.exe tools/patch_section_align.py --dir build\eur\delinks
error: unexpected argument '&&' found
[4/1472] .\dsd.exe lcf -c config\eur\arm9\config.yaml
  && ... patch_lcf_arm9_align.py ... && ... patch_objects_legacy.py ...
FAILED: [code=2] build/eur/arm9.lcf build/eur/objects.txt
error: unexpected argument '&&' found
ninja: build stopped: subcommand failed.
```

`mwasm` would fail identically once a `.s` file enters the
build graph; it just isn't reached because the build dies
earlier.

CI is Linux-only (`.github/workflows/tests.yml` runs
`ubuntu-latest`) and doesn't build the ROM — it only runs
Python unit tests on `tools/**.py`. So the Windows-build
regression has gone unnoticed since the chained rules
were introduced.

**The three affected rules** (all in `tools/configure.py`):

| Rule | Lines | Chain |
|------|-------|-------|
| `delink` | 396–402 | `dsd delink && python patch_section_align.py` |
| `lcf`    | 505–516 | `dsd lcf && python patch_lcf_arm9_align.py && python patch_objects_legacy.py` |
| `mwasm`  | 475–484 | `mwasmarm && python patch_section_align.py --trim-padding` |

The post-processing scripts are **not** optional on any
platform (unlike `transform_dep.py`, which the mwcc family
correctly omits on Windows) — they fix actual link-step
correctness, so the Windows fix has to keep running them.

**Scope — two viable approaches; cloud picks:**

**Approach A (minimal, `cmd /c` wrap).** Detect Windows, wrap
the chained command in `cmd /c "..."` so cmd.exe processes
the `&&`. Pattern parallel to the existing `if
platform.system != "windows":` guards used elsewhere in the
file. Example for the `delink` rule:

```python
delink_chain = (
    f"{DSD} delink --config-path $config_path"
    f" && {PYTHON} {patch_align} --dir $delinks_dir"
)
if platform.system == "windows":
    delink_chain = f'cmd /c "{delink_chain}"'
n.rule(name="delink", command=delink_chain)
```

Beware quoting — Ninja already wraps the rule body when it
substitutes `$config_path` etc., so the inner `"..."` of `cmd
/c` may need escaping (`\"`) or single-quotes. Check the
`generated-files-drift` CI job's diff after running
`tools/configure.py eur` on a Linux runner to confirm the
non-Windows path is byte-identical to today's.

**Approach B (platform-agnostic Python wrapper).** New
`tools/run_chain.py` that takes the chain as separate argv
groups and runs each `subprocess.check_call`-style in sequence.
Replaces the `&&` literal across all three rules. Cleaner
long-term but more code, and `tools/run_chain.py` becomes a
required ninja implicit on every chained rule.

Cloud's call. Approach A is minimal and matches existing
project pattern; B is more robust if more chained rules
appear later. Either is acceptable.

**Required smoke test (brain will re-run before merge):**

On Windows (brain's environment — `C:\Users\leona\Dev\gx-
spirit-caller`):

```
git checkout cloud/windows-build-shell-fix
python tools/configure.py eur
ninja rom
.\dsd.exe check modules -c config\eur\arm9\config.yaml
```

Expected:
1. `ninja rom` builds clean to `gx-spirit-caller_eur.nds`.
2. `dsd check modules` reports 24/27 OK (ARM9 main, DTCM,
   overlay 4 still red per the documented baseline; no other
   module flips red).

On Linux **or** macOS (cloud verifies, or pings any non-
Windows brain to verify):

```
python tools/configure.py eur
ninja rom
```

Expected: byte-identical output to current `main`. The
non-Windows path must not behave differently. A diff of
`build.ninja` between this branch's configure output and
`main`'s should show only Windows-conditional additions —
no edits to the Linux/macOS rule bodies.

If either smoke test fails, the PR doesn't merge.

**Suggested CI add-on (RECOMMENDED, separate brief if scope
balloons):**

Add a Windows job to `.github/workflows/tests.yml` (or a new
`build-windows.yml`) that at minimum runs `python
tools/configure.py eur` (no baserom required for the
configure-only smoke gate; the SHA-1 check is skipped via
`--skip-sha1`). Full `ninja rom` in CI is harder because the
baserom isn't redistributable. If the configure-only gate
fits in this brief, fold it in; if not, file a follow-up.

**Non-scope:**

- ❌ Refactoring the `mwcc` / `mwcc_legacy` / `mwcc_legacy_sp3`
  rule family — its Windows guard already works correctly,
  leave it alone.
- ❌ Touching `dsd` itself or vendoring fixes upstream.
- ❌ Replacing Ninja's `&&` semantics with a different build
  driver. The existing chain pattern is the project's idiom;
  the fix is to make it Windows-aware, not to redesign.
- ❌ Touching `src/`, `AGENTS.md`, `docs/state.md`.
- ❌ Adding the README "Windows quick-start" if it's now
  inaccurate post-fix. That's a separate docs PR if needed.

**Success:**

- Brain on Windows runs `ninja rom` to completion. 24/27
  baseline confirmed via `dsd check modules`.
- Linux / macOS builds still produce byte-identical
  `gx-spirit-caller_eur.nds` (confirm with `sha1sum` or
  equivalent against the current main's `ninja sha1` output).
- PR body shows the brain's Windows reproducer output
  (current failing log + post-fix successful build snippet).

**Branch:** `cloud/windows-build-shell-fix`

**Priority:** HIGH. Brain on Windows is currently blocked from
verifying ANY `src/`-touching PR. PR #392 (decomper wave 22,
brief 057 self-extend 1/2) is sitting open and unverifiable
until this lands. Decomper is parked on #392's outcome before
attempting brief 057 self-extend 2/2.

**After this brief lands:**

1. Brain runs the Windows smoke test on the merged main,
   confirms 24/27 baseline.
2. Brain re-runs the local verify on PR #392, summarises for
   `cntrl_alt_lenny`, offers to merge.
3. On merge of #392, decomper unblocks for brief 057 self-
   extend 2/2 (same selection rule: ≤ 0x60 cap, hard tier,
   next anchor by current ranking).
