# Round 008 exploratory evidence

Stopped round. These are prototype observations, not final acceptance evidence.
Production inputs were at `8b7b6cc5d8634782de67f1598d7c343020cf1010`.
The partial patch is unfinished and must not be treated as a passing delivery.


## Target compiler probes (harness exit 0; individual exits below)

```text
condition-0 compiler exit 0

condition-1 compiler exit 0

condition-2 compiler exit 0

condition-3 compiler exit 0

condition-4 compiler exit 0

condition-5 compiler exit 0

condition-6 compiler exit 0

condition-7 compiler exit 0

condition-8 compiler exit 0

condition-9 compiler exit 0

condition-10 compiler exit 0

for-init compiler exit 1
### mwccarm.exe Compiler:
#    File: <scratch source>
# -----------------------------------------------------------------------------
#       1: void f(void){for(volatile int i=0;i<1;i++) {}}
#   Error:                  ^^^^^^^^
#   expression syntax error
### mwccarm.exe Compiler:
#       1: void f(void){for(volatile int i=0;i<1;i++) {}}
#   Error:                                       ^
#   undefined identifier 'i'

Errors caused tool to abort.

pointer-typedef compiler exit 0

declaration-macro compiler exit 0

multi-decl compiler exit 0

invalid-braceless compiler exit 1
### mwccarm.exe Compiler:
#    File: <scratch source>
# -----------------------------------------------------------------------------
#       1: void f(int c){while(c) volatile int x=c;}
#   Error:                        ^^^^^^^^
#   expression syntax error

Errors caused tool to abort.

braced-control compiler exit 0

```


## Starting lexical lint and three aggregate compiler controls (harness exit 0)

```text
condition-0 []
condition-1 []
condition-2 []
condition-3 []
condition-4 []
condition-5 []
condition-6 []
condition-7 []
condition-8 []
condition-9 []
condition-10 []
for-init []
pointer-typedef []
declaration-macro []
multi-decl []
invalid-braceless []
braced-control [('volatile-local', 'void f(int c){while(c){volatile int x=c;}}')]
src/overlay011/func_ov011_021d2ca8.c compiler exit 0

src/usa/overlay011/func_ov011_021d2bb8.c compiler exit 0

src/jpn/overlay011/func_ov011_021d2bb8.c compiler exit 0

```


## Prototype semantic source scan (exit 1)

```text
src/jpn/overlay000/func_ov000_021ac77c.c:10: do-while-zero: do { Fill32(0, p, 0xa0); p->f_98 = p->f_98 | 0x4000000; p->f_98 = ((p->f_98 & (~0xf80000)) | 0x88000
src/jpn/overlay011/func_ov011_021d2bb8.c:25: volatile-local: volatile struct { int x, y; } p1, p2;
src/main/func_02096040.legacy.c:7: volatile-local: volatile Obj02096040 tmp;
src/overlay000/func_ov000_021ac85c.c:10: do-while-zero: do { Fill32(0, p, 0xa0); p->f_98 = p->f_98 | 0x4000000; p->f_98 = ((p->f_98 & (~0xf80000)) | 0x88000
src/overlay011/func_ov011_021d2ca8.c:25: volatile-local: volatile struct { int x, y; } p1, p2;
src/usa/overlay000/func_ov000_021ac77c.c:10: do-while-zero: do { Fill32(0, p, 0xa0); p->f_98 = p->f_98 | 0x4000000; p->f_98 = ((p->f_98 & (~0xf80000)) | 0x88000
src/usa/overlay011/func_ov011_021d2bb8.c:25: volatile-local: volatile struct { int x, y; } p1, p2;
check_fake_matches: raw-data-directive 0, section-override 0, data-in-pragma-section 0, text-unit-without-function 0, register-pin 0, do-while-zero 3, volatile-local 4 (baseline entries 4)
  NEW: volatile-local src/jpn/overlay011/func_ov011_021d2bb8.c: volatile struct { int x, y; } p1, p2;
  NEW: volatile-local src/overlay011/func_ov011_021d2ca8.c: volatile struct { int x, y; } p1, p2;
  NEW: volatile-local src/usa/overlay011/func_ov011_021d2bb8.c: volatile struct { int x, y; } p1, p2;
check_fake_matches: FAIL
```


## Commands and method

Target compiler probes used the primary checkout's existing compiler; objects
were written to temporary storage and no repository source was changed:

```text
WINEDEBUG=-all MVK_CONFIG_LOG_LEVEL=0 wine <primary>/tools/mwccarm/2.0/sp1p5/mwccarm.exe -proc arm946e -gccext,on -lang c -nolink <source> -o <scratch object>
```

The eleven conditions, in numeric order: `(int)0`, `1-1`, `-0`, `'\0'`,
`NULL` defined as `((void*)0)`, `0.0`, `0 && x`, `((void)0,0)`,
`sizeof(char)-1`, `0 == 1`, and `ZERO` from `enum { ZERO=0 }`.
The enclosing function takes `int x` and contains `do {} while (condition);`.

Other complete inputs:

```c
void f(void){for(volatile int i=0;i<1;i++) {}}
typedef int * volatile VPV; void f(void){VPV p;}
#define DECL(t,n) volatile t n
void f(void){DECL(int,x);}
void f(void){int a=0,* volatile p=&a;}
void f(int c){while(c) volatile int x=c;}
void f(int c){while(c){volatile int x=c;}}
```

The starting lint probe calls `scan_source` for each complete input and prints
`(rule, text)`. The three aggregate controls call it on the committed source,
then compile that source with the command above. All three are compiler-valid
and the starting lint reports no findings for them.

The semantic prototype uses libclang 18.1.1 (installed in a temporary Python
3.13 virtual environment), ARMv5TE, signed char, freestanding C/C++, canonical
type qualification, and `clang_Cursor_Evaluate`. Conditions are converted to
boolean in their original scope so null pointers also have an evaluable integer
value. Metrowerks asm bodies and placement attributes are blanked; original
lexical and object checks remain separate. Statement macro wrappers retain the
previous exemption. Source preprocessor arms are enumerated, with a limit that
fails closed, and every source including inactive legacy units is scanned.
This adaptation is unfinished; it does not yet reject the target-invalid
brace-less declaration that Clang accepts.

Prototype test observations (real output, before stopping):

```text
python3.13 -m pytest -q tests/test_check_factory.py
1 passed, 11 subtests passed in 3.17s
exit 0

python3.13 -m pytest -q tests/test_check_fake_matches.py tests/test_check_fake_matches_variants.py tests/test_gate3.py tests/test_check_ci_contract.py
92 passed, 1 skipped, 29 subtests passed in 1.01s
exit 0

python3.13 -m pytest -q tests/test_semantic_fake_matches.py
FAILED tests/test_semantic_fake_matches.py::TestSemanticLint::test_invalid_syntax_is_a_nonzero_diagnostic
1 failed, 8 passed, 23 subtests passed in 0.31s
exit 1
```

The passing prototype cases include all listed conditions and declaration forms,
macro token pasting, typedef chains, function-like condition macros, Unicode
comments, nested loops, both inactive preprocessor arms, header-expanded types
and conditions, and honest runtime loops and statement macros. The `for` init
must be reclassified as a target syntax control; its prototype semantic test
currently has the wrong expected outcome. No complete red/green regression
campaign against the starting lint was finished.

## Provisional factory design

Historical shipment diffs `288253e4b` and `15a8e9579`, and
`tools/record_shipped.py`, show source additions, assembly deletions, delink
flips and ledger records. The proposed minimal allowlist is `src/**/*.c`,
`src/**/*.cpp`, `src/**/*.s`, the three regions' ARM9/module `delinks.txt`,
and `docs/ledger/attempts.tsv`. Unrelated tooling and documentation mixed into
those historical reviewed shipments do not justify factory write access.
Everything else is denied, including all checker tools/imports, baselines,
`.github/`, CI contract, requirements, agent settings and protected-path lists.
Symlinks and submodules at allowed paths are denied as well.

The proposed `unittest` job uses `pull_request_target`, checks out the literal
base SHA with credentials disabled, fetches the PR head as data, and runs the
stdlib-only base `tools/check_factory.py --event "$GITHUB_EVENT_PATH"` before
checking out proposed code. Branch classification comes from the GitHub event,
not proposed configuration. No secrets are referenced, permissions stay
`contents: read`, and caching is removed. The Windows job retains its name;
no required-check or settings change is proposed. This workflow was not run on
GitHub, and its migration and security design are not accepted or verified.

The test invokes the real base CLI in scratch Git repositories against a match
addition, checker edits, guard removal/replacement, workflow removal/replacement,
imports, dependencies, protected-path edits, agent settings and baselines. Each
attack is rejected for `factory/batch` and exempt for `worker/reviewed`. The
complete three-run and adversarial known-bad/red campaign was not finished.

## Provisional mismatch diagnosis

The starting classifier treats any toolchain name anywhere in Ninja output as
infrastructure. An earlier successful compiler command can therefore turn a
later ROM mismatch into exit 2. `git log -S TOOLCHAIN_MARKERS` returned:

```text
e7f3c93c2 2026-07-31 gate3: attribute toolchain failures as infrastructure
exit 0
```

The patch limits attribution to failed Ninja edges. Its classifier unit tests
passed; neither the required real ROM mutation run nor the genuine toolchain
failure gate experiment was completed. This is not gate acceptance evidence.
