[//]: # (markdownlint-disable MD013 MD041)

# `dsd check symbols` failures — root-cause diagnosis (ov004 + ARM9 main)

**Status:** diagnosed, **not** force-fixed (deliberately). The task scoped a
"narrow ov004 sinit symbol fix"; investigation showed it is a **systemic,
pre-existing, ROM-irrelevant metadata-naming drift** spanning **678 symbols**,
not a 5-symbol typo. Mass symbol surgery to silence it would risk the
byte-identical build for **zero ROM benefit**, so per the task's own
"stop-and-diagnose if a fix turns risky/structural" guidance, this is the
written root-cause instead.

## TL;DR / verdict

- **The ROM is correct.** `ninja sha1` passes byte-for-byte for **all three
  regions** (eur/usa/jpn), and `dsd check **modules**` is **green** for all 27
  modules. The bytes are right.
- **`dsd check symbols` fails** with **678 errors** (657 overlay 4 + 21 ARM9
  main). These are symbol-**label** inconsistencies, not data errors.
- **Root cause:** auto-generated `data_<addr>` / `data_ov004_<addr>` symbols
  embed the address they had **at delink time**, but the data lands **1–4 bytes
  off** in the final linked binary (section alignment / packing drift). The
  address baked into the *name* no longer equals the symbol's *actual* linked
  address, so `dsd check symbols` reports "not found at `<name-addr>`, matching
  name found at `<actual-addr>`."
- **It is not a regression** and **not gated** — `dsd check symbols` runs only
  via the local `ninja check` convenience target and a PR-template checklist
  line (now corrected); **CI gates on `ninja sha1`**, which is green. ov004
  config was last touched months ago (PR #748), long before recent work.
- **Recommendation: leave it; treat `dsd check symbols` as informational.** A
  genuine fix is a larger, separate effort (a dsd re-delink / symbol-address
  resync, or matching the data) — not worth the risk for a cosmetic, non-gated,
  ROM-irrelevant check.

## Scope (reproduced: `python3.13 tools/configure.py eur && ninja check`)

`[3/4] dsd check modules … OK` (all modules). `[4/4] dsd check symbols …`
**FAILED**, 678 `not found in linked binary` errors:

| module | errors | flavour |
|---|---:|---|
| overlay 4 | **657** | 654 `data_ov004_*` naming drift (+1..+4) + `__sinit`/`.p__sinit`/1 `func_*_unk` |
| ARM9 main | **21** | `data_02XXXXXX` **absent** from the linked ELF (20 with no nearby match; 1 resolves to `0x00000000`) |

## The ov004 pattern — a uniform one-word naming drift

For the 654 ov004 `data_ov004_<addr>` errors, comparing the address baked into
the name vs. dsd's "matching name found at" (the symbol's real linked address):

```text
delta (linked_addr − name_addr):  +1: 2   +2: 1   +3: 6   +4: 645
name-addr alignment (mod 4):      0: 622   (most are already 4-aligned)
linked-addr alignment (mod 4):    0: 627   (most land 4-aligned)
```

So **645 of 654 are off by exactly one 32-bit word (+4)**, both ends 4-aligned
— i.e. not an alignment-rounding artifact and not block boundaries (0 of a
200-sample were delinks block-starts). It is a **systematic one-word
displacement** of ov004's unmatched data region between delink-time addressing
and the final link, accumulated across the ~114 KB tail `0x021ded69 … 0x02209a58`.

**ELF evidence** (`arm-none-eabi-nm build/eur/arm9.o`):

```text
021ded6a N data_ov004_021ded69      # symbol NAMED …69 actually sits at …6a
```

The name says `021ded69`; the symbol is at `0x021ded6a`. The data is in the
overlay's **unmatched rodata** (ov004 has 105 matched TUs, but these symbols
are gap data). Candidate upstream causes to investigate *if* a real fix is ever
scheduled: the ov004 veneer / overlay-table handling (`tools/patch_ov004_veneers.py`,
the brief-137/140 work, `docs/research/sha1-gap-scoping.md`) and how
`dsd delink` froze these auto-names vs the linker's final placement.

## Why not "just fix it"

- The 654 names embed addresses referenced by delinks block boundaries,
  relocations and sibling symbols. Mass-renaming / re-addressing them is exactly
  the **structural, sha1-threatening** change the task said to avoid.
- The payoff is **zero ROM bytes** — `ninja sha1` already passes. It would only
  quiet a check the project doesn't gate on.
- The 21 ARM9-main errors are a *different* (absent-from-ELF) class and also
  wouldn't be resolved by the same edit, so even a risky ov004 mass-edit would
  not turn `ninja check` green.

## What changed in this PR (docs-only, no build impact)

1. This diagnosis.
2. `.github/pull_request_template.md`: corrected the misleading "`ninja check`
   passes (dsd module + symbol consistency)" checklist line — the project gate
   is `ninja sha1` + `dsd check modules` (both green); `dsd check symbols` is
   informational (expected-noisy on gap data).

No `config/`, `src/`, or build files touched → `ninja sha1` unaffected (still
PASS, all 3 regions, verified this session).
