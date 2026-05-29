[//]: # (markdownlint-disable MD013 MD041)

# Brief 258 — classify the CSE field-temp reg-alloc class + refresh the C-39 taxonomy

**Status:** both deliverables settled. Direct-mwcc only (no ROM build,
no SHA1). Every verdict is a real mwcc compile this session vs the
`dsd`-delinked orig bytes.

## Headline

- **(A) The CSE field-temp class is a P-11 reg-alloc plateau, NOT
  coercible.** Pilot `func_ov002_02200084`: the natural bitfield form is
  **byte-identical except one register** — the CSE'd `@2` field
  container is r1 (mwcc) where orig has r3. 9 source forms tried; every
  one that reaches r3 introduces a *new* divergence. No clean lever.
  Added to the P-11 census (3 picks).
- **(B) § C-39 refreshed.** C-39f census corrected **11 → ~17** (brief
  257's 6 more folded in); the CSE field-temp residue documented as a
  P-11-class note.

## (A) CSE field-temp — P-11 reg-alloc plateau

3 picks, all ov002, same mechanism: `02200084` (wave 1) + `02292020` +
`022319f4` (wave 2). The `@2` bitfield container is read once at
function entry and CSE'd for a range/branch test **plus** ≥2 bitfield
helper-args of a ≥3-arg helper. orig holds it in a HIGH register
(r3 or r2); mwcc 2.0/sp1p5 takes the LOWEST-FREE register (r1) at the
entry `ldrh` (only r0=self is live).

Pilot `func_ov002_02200084` (0x3c) — field in r3:

```text
push  {r3, lr}
ldrh  r3, [r0, #2]           ; field → r3 (orig) / r1 (mwcc)
lsl r2,r3,#20; lsr r2,r2,#26 ; b11_6 range test (scratch r2)
cmp r2,#2; bne
ldrh  r2, [r0]               ; self->f0 (arg2)
lsl r0,r3,#31; lsl r1,r3,#26 ; bit0 (arg0), b5_1 (arg1) — both from the field reg
lsr r0,r0,#31; lsr r1,r1,#27
bl    func_ov002_021b4098    ; helper(bit0, b5_1, f0)
pop   {r3, pc}
```

### Variant matrix (falsification — coercible would mean field-in-r3 with no other divergence)

| Form | Field reg | Other divergence |
|---|---|---|
| `v0` member bitfields (natural) | **r1** | **none — else byte-identical** |
| `v1` named `unsigned` + `>>/&` masks | r3 | extraction becomes `lsr/and` (wrong) |
| `v3` named `unsigned` + `(x<<K)>>K` | r3 | bit0 collapses to `and #1` (P-1) |
| `v4` `signed int` local | r3 | `asr` (sign-extend) |
| `v5` local bitfield-struct copy | r3 | adds `strh r3,[sp]` spill + scratch r1 |
| `v6` separate `b0`/`b51` locals | — | different shape (`mov r3,r0` prologue) |
| `v7` `((x<<31)>>31)+0` trick | r3 | bit0 still `and` (collapse not defeated) |
| `v8` union (word + bitfield view) | r1 | (word local dead) == `v0` |
| `v9` bitfield + early-`f0` local | r1 | == `v0` |

**Result — falsified for coercibility.** The natural bitfield form
(`v0`/`v8`/`v9`) is byte-identical to orig *except* the field container
register (r1 vs r3) and the knock-on `lsl/lsr` source regs. Every form
that gets the field into r3 breaks something else, because the two
requirements conflict:

- **bit0-as-`lsl/lsr`** requires a *bitfield* (`self->bit0`) — which
  CSEs the container into r1.
- **field-in-r3** requires a *named local* — which either collapses
  bit0 to `and #1` (the `(x<<31)>>31` shift form, P-1; `(x>>0)&1`
  likewise) or, as a local bitfield-struct copy, spills (`strh r3,[sp]`).

gotcha-7-resistant: the field is loaded at entry, before any helper-arg
register commits, so the allocator takes the lowest-free reg; and adding
args to push the temp higher would change the function shape (orig takes
only `self`). The permuter is the untested fall-through (cite P-11 /
brief-198 precedent, not a run this session).

### Verdict

**P-11-class reg-allocator plateau** — same family as the brief-254
small reg-alloc picks (~0x3c, below P-11's documented 0x5c-0x74 detector
floor). The 3 picks are added to the P-11 census; `02292020` holds the
field in r2 (vs r3 for the other two), confirming the mechanism is "a
high reg" not specifically r3. Not classifier-detectable (the natural
build is byte-identical bar one register — indistinguishable from any
matchable bitfield function), so no `predict_walls.py` rule.

## (B) § C-39 taxonomy refresh

1. **C-39f census 11 → ~17.** Brief 256 scoped 11 `db973`-family
   table-index picks; brief 257's wave-2 scan found 6 more with the
   identical `and ip,#1; mul stride; ldr [base, idx]` core —
   `0222a648`, `0220b6dc`, `0220bbd0`, `02238820`, `02234894`,
   `0220e2f0`. Folded into the C-39f entry.
2. **CSE field-temp residue note** added under § C-39 (the (A) verdict),
   cross-linked to the P-11 census.

§ C-39 now reads: base C-39 + sub-shapes C-39a/b/d/e (coercible) + C-39f
(coercible, ~17, gotcha 14) + the CSE field-temp residue (P-11-class,
not coercible). C-39c is P-13 (cross-tier irreducible, separate).

## What did NOT pan out

1. **No coercion for the CSE field-temp class.** It is *so* close — one
   register on an otherwise byte-identical body — yet none of 9 forms
   flips just that register cleanly. The proximity is a trap: it reads
   like a missing one-line lever, but the bitfield-vs-named-local
   tension is structural.
2. **The shift-form bit0 (`(x<<31)>>31`)** does not defeat the P-1
   `and #1` collapse, so it cannot stand in for the bitfield read while
   also giving field-in-r3.
3. **Local bitfield-struct copy** gets field-in-r3 *and* `lsl/lsr` bit0,
   but materializes the local (`strh r3,[sp]`) — a different 1-insn
   divergence, not a win.

## Falsification-test ledger (this session)

| Claim | Test | Result |
|---|---|---|
| CSE field-temp coercible | 9 source forms on `02200084` | falsified — none gives field-in-r3 cleanly |
| natural form differs by 1 reg only | `v0` vs orig | byte-identical except container reg (r1 vs r3) |
| bit0 shift-form avoids `and` | `v3` / `v7` | false — collapses to `and #1` (P-1) |
| wave-2 siblings share the class | disasm `02292020` / `022319f4` | confirmed (field in r2 / r3, same CSE pattern) |

## Cross-references

- `docs/research/brief-257-c39-ov002-drain-wave2.md` — the CSE
  field-temp ask + the C-39f census-is-bigger flag.
- `docs/research/brief-256-c39-table-index-and-overfire-scope.md` —
  C-39f (gotcha 14).
- `docs/research/codegen-walls.md` § C-39f + the CSE field-temp residue
  note + § P-11 census.
- `docs/research/brief-254-track2-leading-edge-and-c42-resisters.md` —
  the small reg-alloc plateaus this joins in the P-11 census.
