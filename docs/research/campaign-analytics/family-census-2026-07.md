# Structural family census — July 2026 (Brief 658)

Build-free research catalog of newly visible readable-C candidates. This is a mechanical ranking of existing repository data, not a matchability judgment.

## Result at a glance

The corrected EUR pool contains **6,117 candidates**: 2,768 in `overlay002`, 2,372 never-assessed in `main`, and the remainder in the mid-size overlays. The census found **91 new C-anchored relocation families** and **135 new normalized-assembly shape families**. Six shape groups share at least two candidate members with an anchor group; therefore the conservative deduplicated record count is **220**, while the two signal views are kept separate below.

Anchor-backed families rank first because a matched C sibling is the highest-leverage starting point. Within the anchorless tranche, `overlay002` is listed before `main`, then the mid-size overlays. The live CC lanes are sweeping `overlay002` (brief 654) and `main` (brief 655), so all member lists are a snapshot and may shift as those agents ship.

| Census signal | New family groups | Candidate member slots | Matched-anchor groups | What it means |
|---|---:|---:|---:|---|
| Exact relocation signature + C anchor | 91 | 268 | 91 | Ready-to-propagate shape; C-only matched ranges filtered from delinks. |
| Normalized source assembly shape | 135 | 327 | 0 | Candidate-only structural families; anchorless unless the C-anchor view finds one. |
| **Conservative deduplicated records** | **220** | — | **91** | Six two-or-more-member overlaps removed from the count. |

The prior sweep queues contributed 64 address tokens to the exclusion set. Any candidate-only shape group containing one of those addresses was omitted, so the tables below do not re-list the families already catalogued in `cmatch-sweep-queue.md` or `cmatch-sweep-queue-overlays.md`.

## Anchor verification audit (queue item `q-family-verify`)

The census's “C anchor” label was checked against the current EUR tree on
2026-07-22. The method was deliberately build-free:

1. Read every EUR `delinks.txt` and retain only `complete` TUs whose source
   path ends in `.c`/`.cpp` (including `.legacy.c`, `.thumb.c`, and
   `.legacy_sp3.c`). A complete `.s` TU is **not** a C anchor.
2. For the first 20 anchor rows (`A-01`–`A-20`), look up the exemplar address
   in the EUR symbols and test whether a retained C TU actually covers that
   address.
3. Recompute each exemplar's `(size, relocation-offset/kind signature)` from
   the committed EUR `relocs.txt`, then count current non-C functions with the
   same fingerprint. This checks the claimed member shape without compiling.
4. Mark `sig=0` rows **AMBIGUOUS** even when the size and empty signature
   repeat: an empty relocation signature is not enough to distinguish leaf
   functions. Mark a non-empty-signature row **VERIFIED** only when the C
   anchor exists and at least one same-shape candidate remains; otherwise it
   is **SUSPECT**.

| Family | Claimed exemplar | C anchor now? | Current same-shape non-C members | Verification |
|---|---|---|---:|---|
| `A-01` | `0207708c` | no | 5 | AMBIGUOUS (`sig=0`) |
| `A-02` | `0209085c` | no | 2 | SUSPECT |
| `A-03` | `020b3648` | no | 1 | AMBIGUOUS (`sig=0`) |
| `A-04` | `0208b1c8` | no | 1 | AMBIGUOUS (`sig=0`) |
| `A-05` | `0206be1c` | no | 6 | AMBIGUOUS (`sig=0`) |
| `A-06` | `02067b8c` | no | 13 | AMBIGUOUS (`sig=0`) |
| `A-07` | `0207e214` | no | 4 | SUSPECT |
| `A-08` | `02031794` | no | 16 | AMBIGUOUS (`sig=0`) |
| `A-09` | `02007f38` | no | 3 | SUSPECT |
| `A-10` | `02001e5c` | no | 12 | AMBIGUOUS (`sig=0`) |
| `A-11` | `02034094` | no | 10 | AMBIGUOUS (`sig=0`) |
| `A-12` | `020644a4` | no | 15 | AMBIGUOUS (`sig=0`) |
| `A-13` | `020442f8` | no | 10 | AMBIGUOUS (`sig=0`) |
| `A-14` | `0203ab98` | no | 51 | AMBIGUOUS (`sig=0`) |
| `A-15` | `020a978c` | no | 2 | SUSPECT |
| `A-16` | `02054840` | no | 1 | SUSPECT |
| `A-17` | `0205bccc` | no | 11 | AMBIGUOUS (`sig=0`) |
| `A-18` | `02021660` | no | 11 | AMBIGUOUS (`sig=0`) |
| `A-19` | `0203aeec` | no | 9 | AMBIGUOUS (`sig=0`) |
| `A-20` | `02038dac` | no | 8 | SUSPECT |

**Sample result: 0 VERIFIED, 6 SUSPECT, 14 AMBIGUOUS.** Applying the same
address/source/signature test mechanically to all 91 `A-*` rows gives **0
VERIFIED, 54 SUSPECT, and 37 AMBIGUOUS**. The full index below remains the
original census snapshot; use the status column above for the sampled rows
and treat every un-audited row as unverified until it passes the same check.

This is a stale-anchor finding, not a claim that the candidate members are
identical in machine code. The non-empty-signature SUSPECT rows still have
same-shaped candidates worth independent review; the `sig=0` rows should not
be scheduled as near-zero-shot propagation families.

## Ranked anchor-backed families — top 10

These are ranked mechanically by `(new candidate members + matched anchors) × matched anchors`, then candidate count, then size. `sig=0` means the exact relocation signature is empty; those rows are intentionally labeled **ambiguous** because equal size plus no relocations can describe unrelated leaf functions.

| Rank | Family | Module | Size | New candidate members | Anchor? | Matched anchor addresses | Exemplar | Signal |
|---:|---|---|---:|---|---|---|---|---|
| 1 | `A-01` | `main` | `0x8` | `0207708c`, `020a9914` | yes | `02000c44`, `02001e54`, `0200aa00`, `0200ac24`, `0200ac3c`, `020117dc`, `02011b84`, `02013998`, `0201e7e4`, `0201e7ec`, `02021c28`, `020258bc`, `0203353c`, `02033544`, `0203354c`, `0203410c`, `0203dde0`, `02049f6c`, `020536b4`, `020536c8`, `02053704`, `02053720`, `02054140`, `02062508`, `02062510`, `02062528`, `02064a98`, `02067e8c`, `02068114`, `0206849c`, `020684a4`, `020684ac`, `020684c0`, `02068578`, `0206895c`, `02068964`, `02068990`, `020689b0`, `020689dc`, `02068ca0`, `0206a314`, `02074450`, `0207d318`, `0207def8`, `0207df00`, `0207df08`, `0207df10`, `0207df18`, `0207e230`, `0207f87c`, `0207fce0`, `02081f48`, `020908f0`, `02091688`, `02091814`, `02092380`, `02092e80`, `02092e88`, `02095e60`, `0209678c`, `02098618`, `02098620`, `020986b8`, `0209b49c`, `020b2970`, `020b427c` | `0207708c` | exact relocation sig=0; AMBIGUOUS empty signature |
| 2 | `A-02` | `main` | `0xc` | `0209085c` | yes | `02006e1c`, `0200974c`, `0200a9f4`, `02018a2c`, `0201d364`, `0201e7f4`, `0201e800`, `02020b78`, `020216b0`, `020216bc`, `020334b4`, `020334c0`, `020337fc`, `02033858`, `020341a4`, `02036584`, `020379ec`, `02037ab8`, `02045564`, `02045d00`, `02046088`, `02049f60`, `02052ff4`, `02053018`, `02053158`, `02053164`, `02053644`, `02055324`, `02060c90`, `02062784`, `02062790`, `0206279c`, `02063710`, `0206e7b0`, `0206ea84`, `0206ecb4`, `0206ecc0`, `0207cfa4`, `0207cfb0`, `0207cfbc`, `0207d4d0`, `0207daf4`, `0207e540`, `02087168`, `020879fc`, `02096228`, `0209cacc`, `0209cad8`, `020a05f8`, `020a3ab4`, `020b0384`, `020b1958`, `020b4314` | `0209085c` | exact relocation sig=1 |
| 3 | `A-03` | `main` | `0x10` | `020b3648` | yes | `02001e84`, `0201ada0`, `0201b6c4`, `0201b6d4`, `02021650`, `02022260`, `02027ed4`, `0202c518`, `02033308`, `020335b8`, `020340d0`, `0203c814`, `0205da1c`, `02061530`, `02062518`, `02064480`, `0206e580`, `02076c4c`, `02078ec8`, `0207d36c`, `0207e6e0`, `0207e738`, `020854e4`, `02087e90`, `02087ea0`, `02092e4c`, `02092e5c`, `020930a0`, `0209360c`, `02093c10`, `020a09b8`, `020b41e8` | `020b3648` | exact relocation sig=0; AMBIGUOUS empty signature |
| 4 | `A-04` | `main` | `0x18` | `0208b1c8` | yes | `02001dc4`, `02031ffc`, `02032a00`, `02032bfc`, `02032c14`, `02032c2c`, `02033f10`, `02033f28`, `02034014`, `020340b8`, `02053000`, `02068368`, `02068998`, `0207cfdc`, `0207d1b8`, `0207db74`, `0207e3bc`, `0207e8a0`, `02087eb0`, `0208b040`, `0208b058`, `020908f8`, `02090910`, `02090960`, `02090978`, `020937b8`, `020937e4`, `0209448c`, `020944d4`, `020944ec`, `020a584c`, `020a60a8` | `0208b1c8` | exact relocation sig=0; AMBIGUOUS empty signature |
| 5 | `A-05` | `main` | `0xc` | `0206be1c`, `02074e4c`, `020b3808` | yes | `0201e80c`, `02022270`, `02031ff0`, `02032344`, `02032e80`, `020335c8`, `02041520`, `020536bc`, `020604a4`, `020684b4`, `0206e468`, `02078ebc`, `0207ead8`, `0207f850`, `02081f50`, `02082044`, `02082050`, `02084fbc`, `02087ec8`, `02088fe4`, `02088ff0`, `02088ffc`, `0208b0f0`, `0208b0fc`, `02092860`, `020937fc`, `02093808`, `02093814`, `0209bfc8`, `020a6d48` | `0206be1c` | exact relocation sig=0; AMBIGUOUS empty signature |
| 6 | `A-06` | `main` | `0x1c` | `02067b8c`, `02078eec`, `0207f8f8`, `0208b1ac`, `02098cdc`, `0209aa48`, `0209bf18`, `0209d788` | yes | `0201397c`, `020190d0`, `02021cbc`, `020240a0`, `02032a18`, `020385bc`, `0203d6a8`, `0203d6c4`, `0203ddc4`, `020566d8`, `02073fac`, `0207e8f4`, `0207f884`, `02087d10`, `0208b190`, `0208c8b0`, `0208e318`, `0208e4d0`, `02092844`, `020944a4`, `020a099c`, `020aaddc`, `020aee3c` | `02067b8c` | exact relocation sig=0; AMBIGUOUS empty signature |
| 7 | `A-07` | `main` | `0x1c` | `0207e214` | yes | `02001d68`, `02006110`, `0200612c`, `02006148`, `02008598`, `020097d4`, `0201d060`, `0201d134`, `0201f19c`, `02021c0c`, `02045280`, `020469b4`, `02046ac4`, `02048108`, `02052334`, `02052350`, `02068480`, `02070ea8`, `0208738c`, `02089008`, `02093084`, `0209dc8c`, `020a5878` | `0207e214` | exact relocation sig=1 |
| 8 | `A-08` | `main` | `0x2c` | `02031794`, `02067328`, `0206e504`, `02079e20`, `0207da1c`, `0208b300`, `0208be70`, `020a73e8`, `020a7414`, `020b4284` | yes | `02001d98`, `0201e928`, `0201ef10`, `02031f70`, `020340e0`, `02044228`, `020459c4`, `02053748`, `0205d534`, `0206a958`, `02073da0`, `0207cf78`, `0207d18c`, `0207e638`, `0208c884`, `0208e4ec`, `0208e518` | `02031794` | exact relocation sig=0; AMBIGUOUS empty signature |
| 9 | `A-09` | `main` | `0x20` | `02007f38` | yes | `020071a4`, `0201d114`, `0202b0e0`, `0202b7cc`, `0202c44c`, `0204548c`, `020454ac`, `020466f4`, `02052798`, `020527b8`, `020527d8`, `020527f8`, `02070f24`, `02085054`, `02087328`, `02087fe0`, `0208904c`, `02095bf8`, `020a3634`, `020b42f4` | `02007f38` | exact relocation sig=1 |
| 10 | `A-10` | `main` | `0x28` | `02001e5c`, `0200f01c`, `02052704`, `02077094`, `02084ac4`, `0208bf14`, `0209640c`, `020a6a00`, `020ace98`, `020b0034` | yes | `020070dc`, `0200b35c`, `0200bfa4`, `0200bfcc`, `0202f3e8`, `0203402c`, `020442d0`, `0205d5a0`, `02068424`, `0207d430`, `0207d9f4`, `02084a9c`, `02087ce8`, `02096794`, `020a3380` | `02001e5c` | exact relocation sig=0; AMBIGUOUS empty signature |

All anchor addresses above are functions whose EUR delinks section is claimed by a real `.c`/`.legacy.c` TU. Candidate members are still `.s` files in the readable-C pool. The anchor list is evidence of an existing C sibling, not a claim that direct propagation will succeed.

## ov002 priority tranche — largest new anchorless shape families

These are the first ten `overlay002` groups from the source-shape view, ranked by family size then smaller function size. They are the newly visible runway that prior queues did not structurally cluster. No matched C sibling was found by the exact relocation-anchor cross-check for these rows; crack the listed exemplar first and re-check the rest after the live ov002 sweep settles.

| Rank | Family | Members | Module(s) | Size | Anchor? | Exemplar | Shape signal |
|---:|---|---|---|---:|---|---|---|
| 1 | `S-001` | `022483ac`, `02248ce8`, `0224b158`, `0224c980`, `0224cc90`, `0224d2ec`, `0224d424`, `0224e230`, `0224e490`, `0224eab4`, `02250350`, `02252af8`, `02252b80`, `02252ca4` | `overlay002` | `0x88` | no | `022483ac` | arm, 2 calls, 2 branches, 3S/0N pool |
| 2 | `S-002` | `0224a6f4`, `0224b948`, `0224c034`, `0224c160`, `0224cd18`, `0224cf14`, `0224d794`, `0224f7a0` | `overlay002` | `0x84` | no | `0224a6f4` | arm, 2 calls, 2 branches, 3S/0N pool |
| 3 | `S-003` | `02221e3c`, `0222ed1c`, `02235d78`, `02236cc4`, `02237ca4`, `02237e00` | `overlay002` | `0x94` | no | `02221e3c` | arm, 1 calls, 0 branches, 3S/0N pool |
| 4 | `S-004` | `0224a4f8`, `0224ab44`, `0224e660`, `0224e9cc`, `0224f824`, `022505e8` | `overlay002` | `0x88` | no | `0224a4f8` | arm, 2 calls, 2 branches, 3S/0N pool |
| 5 | `S-005` | `0224c2a4`, `0224d044`, `0224f548`, `0225070c`, `0225170c` | `overlay002` | `0xb4` | no | `0224c2a4` | arm, 4 calls, 4 branches, 3S/0N pool |
| 6 | `S-006` | `0224bb54`, `0224d8b4`, `022517c0`, `02252734`, `02252914` | `overlay002` | `0x84` | no | `0224bb54` | arm, 2 calls, 2 branches, 3S/0N pool |
| 7 | `S-007` | `02248b5c`, `0224b27c`, `0224d4ac`, `0224ee48`, `0224f8ac` | `overlay002` | `0x64` | no | `02248b5c` | arm, 1 calls, 1 branches, 3S/0N pool |
| 8 | `S-008` | `021b98c4`, `021b993c`, `021b9a30`, `021b9aa8` | `overlay002` | `0x78` | no | `021b98c4` | arm, 1 calls, 1 branches, 3S/0N pool |
| 9 | `S-009` | `0224c8c4`, `0224e2b8`, `0224e840` | `overlay002` | `0xbc` | no | `0224c8c4` | arm, 5 calls, 5 branches, 3S/0N pool |
| 10 | `S-010` | `02249b88`, `0224ef84`, `0224f024` | `overlay002` | `0xa0` | no | `02249b88` | arm, 3 calls, 3 branches, 3S/0N pool |

The full ov002 candidate-only family index is below; the top-ten table is the action-facing slice, not a claim that the remaining 2,768 functions are singletons.

## Mid-size overlay signal

One high-leverage cross-overlay shape is new and should be kept together: six 0x118-byte functions in `overlay004`, `overlay005`, `overlay008`, `overlay009`, `overlay014`, and `overlay016` share the same normalized ARM opcode shape (one call, two branches, no literal pool). It has no C anchor in the filtered view and is therefore an exemplar-first family, not a zero-shot propagation target.

## Complete new-family index

The index records every family group in both mechanical views. Candidate counts are pool members; anchor counts are real C siblings. The six shape/anchor overlaps are retained with both signal labels so an operator can see why a group ranked in both views.

| ID | Signal | Module(s) | Size | Candidates | Anchors | Exemplar | Signature / note |
|---|---|---|---:|---:|---:|---|---|
| `A-01` | reloc-anchor | `main` | `0x8` | 2 | 66 | `0207708c` | reloc-sig=0 |
| `A-02` | reloc-anchor | `main` | `0xc` | 1 | 53 | `0209085c` | reloc-sig=1 |
| `A-03` | reloc-anchor | `main` | `0x10` | 1 | 32 | `020b3648` | reloc-sig=0 |
| `A-04` | reloc-anchor | `main` | `0x18` | 1 | 32 | `0208b1c8` | reloc-sig=0 |
| `A-05` | reloc-anchor | `main` | `0xc` | 3 | 30 | `0206be1c` | reloc-sig=0 |
| `A-06` | reloc-anchor | `main` | `0x1c` | 8 | 23 | `02067b8c` | reloc-sig=0 |
| `A-07` | reloc-anchor | `main` | `0x1c` | 1 | 23 | `0207e214` | reloc-sig=1 |
| `A-08` | reloc-anchor | `main` | `0x2c` | 10 | 17 | `02031794` | reloc-sig=0 |
| `A-09` | reloc-anchor | `main` | `0x20` | 1 | 20 | `02007f38` | reloc-sig=1 |
| `A-10` | reloc-anchor | `main` | `0x28` | 10 | 15 | `02001e5c` | reloc-sig=0 |
| `A-11` | reloc-anchor | `main` | `0x24` | 6 | 16 | `02034094` | reloc-sig=0 |
| `A-12` | reloc-anchor | `main` | `0x20` | 10 | 13 | `020644a4` | reloc-sig=0 |
| `A-13` | reloc-anchor | `main` | `0x30` | 9 | 13 | `020442f8` | reloc-sig=0 |
| `A-14` | reloc-anchor | `main` | `0x4` | 1 | 15 | `0203ab98` | reloc-sig=0 |
| `A-15` | reloc-anchor | `main` | `0x2c` | 1 | 15 | `020a978c` | reloc-sig=1 |
| `A-16` | reloc-anchor | `main` | `0x28` | 1 | 13 | `02054840` | reloc-sig=1 |
| `A-17` | reloc-anchor | `main` | `0x40` | 10 | 7 | `0205bccc` | reloc-sig=0 |
| `A-18` | reloc-anchor | `main` | `0x50` | 10 | 7 | `02021660` | reloc-sig=0 |
| `A-19` | reloc-anchor | `main` | `0x58` | 6 | 8 | `0203aeec` | reloc-sig=0 |
| `A-20` | reloc-anchor | `main` | `0x30` | 3 | 9 | `02038dac` | reloc-sig=1 |
| `A-21` | reloc-anchor | `main` | `0x2c` | 2 | 8 | `020821e4` | reloc-sig=1 |
| `A-22` | reloc-anchor | `main` | `0x28` | 4 | 7 | `02064d88` | reloc-sig=1 |
| `A-23` | reloc-anchor | `main` | `0x28` | 3 | 7 | `0201d5c0` | reloc-sig=1 |
| `A-24` | reloc-anchor | `main` | `0x44` | 11 | 4 | `0203deac` | reloc-sig=0 |
| `A-25` | reloc-anchor | `main` | `0x20` | 1 | 7 | `020534b4` | reloc-sig=1 |
| `A-26` | reloc-anchor | `main` | `0x24` | 1 | 7 | `020a32e4` | reloc-sig=1 |
| `A-27` | reloc-anchor | `main` | `0x3c` | 2 | 5 | `0200fdc0` | reloc-sig=1 |
| `A-28` | reloc-anchor | `main` | `0x54` | 2 | 5 | `0203ed80` | reloc-sig=0 |
| `A-29` | reloc-anchor | `main` | `0x48` | 14 | 2 | `0200c23c` | reloc-sig=0 |
| `A-30` | reloc-anchor | `main` | `0x3c` | 13 | 2 | `02025880` | reloc-sig=0 |
| `A-31` | reloc-anchor | `main` | `0x38` | 6 | 3 | `020683ec` | reloc-sig=0 |
| `A-32` | reloc-anchor | `main` | `0x6c` | 8 | 2 | `020061bc` | reloc-sig=0 |
| `A-33` | reloc-anchor | `main` | `0x4c` | 5 | 2 | `020670f4` | reloc-sig=0 |
| `A-34` | reloc-anchor | `main` | `0x64` | 5 | 2 | `02033fb0` | reloc-sig=0 |
| `A-35` | reloc-anchor | `main` | `0x24` | 1 | 3 | `02032724` | reloc-sig=1 |
| `A-36` | reloc-anchor | `main` | `0x24` | 1 | 3 | `020a3afc` | reloc-sig=2 |
| `A-37` | reloc-anchor | `main` | `0x34` | 1 | 3 | `0208b070` | reloc-sig=1 |
| `A-38` | reloc-anchor | `main` | `0x44` | 1 | 3 | `0204320c` | reloc-sig=3 |
| `A-39` | reloc-anchor | `main` | `0x78` | 1 | 3 | `0202f500` | reloc-sig=0 |
| `A-40` | reloc-anchor | `main` | `0x40` | 3 | 2 | `02022540` | reloc-sig=1 |
| `A-41` | reloc-anchor | `main` | `0x60` | 3 | 2 | `0202e5ac` | reloc-sig=0 |
| `A-42` | reloc-anchor | `main` | `0x30` | 2 | 2 | `020938c8` | reloc-sig=1 |
| `A-43` | reloc-anchor | `main` | `0x44` | 2 | 2 | `02038d2c` | reloc-sig=1 |
| `A-44` | reloc-anchor | `main` | `0x58` | 2 | 2 | `0202d9a0` | reloc-sig=1 |
| `A-45` | reloc-anchor | `main` | `0x68` | 5 | 1 | `0200fa90` | reloc-sig=0 |
| `A-46` | reloc-anchor | `main` | `0x80` | 5 | 1 | `02038674` | reloc-sig=0 |
| `A-47` | reloc-anchor | `main` | `0x94` | 5 | 1 | `0201d620` | reloc-sig=0 |
| `A-48` | reloc-anchor | `main` | `0x24` | 1 | 2 | `02054c0c` | reloc-sig=1 |
| `A-49` | reloc-anchor | `main` | `0x38` | 1 | 2 | `0201aabc` | reloc-sig=1 |
| `A-50` | reloc-anchor | `main` | `0x38` | 1 | 2 | `02067b54` | reloc-sig=2 |
| `A-51` | reloc-anchor | `main` | `0x44` | 1 | 2 | `0206eb08` | reloc-sig=1 |
| `A-52` | reloc-anchor | `main` | `0x48` | 1 | 2 | `02067870` | reloc-sig=1 |
| `A-53` | reloc-anchor | `main` | `0x5c` | 4 | 1 | `0206afec` | reloc-sig=0 |
| `A-54` | reloc-anchor | `main` | `0x88` | 4 | 1 | `0200c79c` | reloc-sig=0 |
| `A-55` | reloc-anchor | `main` | `0x8c` | 4 | 1 | `0206a724` | reloc-sig=0 |
| `A-56` | reloc-anchor | `main` | `0x3c` | 3 | 1 | `02087e54` | reloc-sig=1 |
| `A-57` | reloc-anchor | `main` | `0x28` | 2 | 1 | `0203f718` | reloc-sig=2 |
| `A-58` | reloc-anchor | `main` | `0x34` | 2 | 1 | `02022580` | reloc-sig=2 |
| `A-59` | reloc-anchor | `main` | `0x34` | 2 | 1 | `0203eb14` | reloc-sig=1 |
| `A-60` | reloc-anchor | `main` | `0x40` | 2 | 1 | `0206da98` | reloc-sig=1 |
| `A-61` | reloc-anchor | `main` | `0x68` | 2 | 1 | `0200fd1c` | reloc-sig=1 |
| `A-62` | reloc-anchor | `main` | `0xb0` | 2 | 1 | `0206904c` | reloc-sig=0 |
| `A-63` | reloc-anchor | `main` | `0xc8` | 2 | 1 | `0202e79c` | reloc-sig=0 |
| `A-64` | reloc-anchor | `main` | `0xcc` | 2 | 1 | `020678b8` | reloc-sig=0 |
| `A-65` | reloc-anchor | `main` | `0xe0` | 2 | 1 | `020b0afc` | reloc-sig=0 |
| `A-66` | reloc-anchor | `main` | `0x30` | 1 | 1 | `0203cb90` | reloc-sig=2 |
| `A-67` | reloc-anchor | `main` | `0x30` | 1 | 1 | `02054c78` | reloc-sig=2 |
| `A-68` | reloc-anchor | `main` | `0x34` | 1 | 1 | `0201a5c0` | reloc-sig=1 |
| `A-69` | reloc-anchor | `main` | `0x34` | 1 | 1 | `02065d18` | reloc-sig=1 |
| `A-70` | reloc-anchor | `main` | `0x34` | 1 | 1 | `0208226c` | reloc-sig=1 |
| `A-71` | reloc-anchor | `main` | `0x34` | 1 | 1 | `0209e0f0` | reloc-sig=2 |
| `A-72` | reloc-anchor | `main` | `0x38` | 1 | 1 | `0207be90` | reloc-sig=2 |
| `A-73` | reloc-anchor | `main` | `0x3c` | 1 | 1 | `0201904c` | reloc-sig=1 |
| `A-74` | reloc-anchor | `main` | `0x3c` | 1 | 1 | `0202b3d4` | reloc-sig=1 |
| `A-75` | reloc-anchor | `main` | `0x3c` | 1 | 1 | `02038d70` | reloc-sig=2 |
| `A-76` | reloc-anchor | `main` | `0x3c` | 1 | 1 | `0206b7d8` | reloc-sig=1 |
| `A-77` | reloc-anchor | `main` | `0x3c` | 1 | 1 | `0207d458` | reloc-sig=3 |
| `A-78` | reloc-anchor | `main` | `0x3c` | 1 | 1 | `02087918` | reloc-sig=1 |
| `A-79` | reloc-anchor | `main` | `0x48` | 1 | 1 | `02009a68` | reloc-sig=2 |
| `A-80` | reloc-anchor | `main` | `0x48` | 1 | 1 | `0206bf94` | reloc-sig=1 |
| `A-81` | reloc-anchor | `main` | `0x4c` | 1 | 1 | `02084dc0` | reloc-sig=1 |
| `A-82` | reloc-anchor | `main` | `0x4c` | 1 | 1 | `020a3144` | reloc-sig=1 |
| `A-83` | reloc-anchor | `main` | `0x50` | 1 | 1 | `0207034c` | reloc-sig=2 |
| `A-84` | reloc-anchor | `main` | `0x54` | 1 | 1 | `0207092c` | reloc-sig=3 |
| `A-85` | reloc-anchor | `main` | `0x58` | 1 | 1 | `02044c60` | reloc-sig=1 |
| `A-86` | reloc-anchor | `main` | `0x6c` | 1 | 1 | `02068890` | reloc-sig=1 |
| `A-87` | reloc-anchor | `main` | `0x70` | 1 | 1 | `020125ac` | reloc-sig=2 |
| `A-88` | reloc-anchor | `main` | `0x74` | 1 | 1 | `020900a0` | reloc-sig=4 |
| `A-89` | reloc-anchor | `main` | `0x98` | 1 | 1 | `0203def0` | reloc-sig=0 |
| `A-90` | reloc-anchor | `main` | `0xc4` | 1 | 1 | `0208b1e0` | reloc-sig=0 |
| `A-91` | reloc-anchor | `main` | `0xf8` | 1 | 1 | `0200f044` | reloc-sig=0 |
| `S-001` | source-shape | `overlay002` | `0x88` | 14 | 0 | `022483ac` | `arm/2 calls/2 branches/3S/0N` |
| `S-002` | source-shape | `overlay002` | `0x84` | 8 | 0 | `0224a6f4` | `arm/2 calls/2 branches/3S/0N` |
| `S-003` | source-shape | `overlay002` | `0x94` | 6 | 0 | `02221e3c` | `arm/1 calls/0 branches/3S/0N` |
| `S-004` | source-shape | `overlay002` | `0x88` | 6 | 0 | `0224a4f8` | `arm/2 calls/2 branches/3S/0N` |
| `S-005` | source-shape | `overlay002` | `0xb4` | 5 | 0 | `0224c2a4` | `arm/4 calls/4 branches/3S/0N` |
| `S-006` | source-shape | `overlay002` | `0x84` | 5 | 0 | `0224bb54` | `arm/2 calls/2 branches/3S/0N` |
| `S-007` | source-shape | `overlay002` | `0x64` | 5 | 0 | `02248b5c` | `arm/1 calls/1 branches/3S/0N` |
| `S-008` | source-shape | `overlay002` | `0x78` | 4 | 0 | `021b98c4` | `arm/1 calls/1 branches/3S/0N` |
| `S-009` | source-shape | `overlay002` | `0xbc` | 3 | 0 | `0224c8c4` | `arm/5 calls/5 branches/3S/0N` |
| `S-010` | source-shape | `overlay002` | `0xa0` | 3 | 0 | `02249b88` | `arm/3 calls/3 branches/3S/0N` |
| `S-011` | source-shape | `overlay002` | `0x9c` | 3 | 0 | `02227c4c` | `arm/1 calls/0 branches/3S/0N` |
| `S-012` | source-shape | `overlay002` | `0x98` | 3 | 0 | `02249918` | `arm/3 calls/3 branches/3S/0N` |
| `S-013` | source-shape | `overlay002` | `0x94` | 3 | 0 | `0224b01c` | `arm/4 calls/0 branches/2S/0N` |
| `S-014` | source-shape | `overlay002` | `0x90` | 3 | 0 | `0226d6f4` | `arm/3 calls/1 branches/2S/0N` |
| `S-015` | source-shape | `overlay002` | `0x80` | 3 | 0 | `021de940` | `arm/1 calls/1 branches/0S/0N` |
| `S-016` | source-shape | `overlay002` | `0x7c` | 3 | 0 | `021ba294` | `arm/2 calls/1 branches/3S/0N` |
| `S-017` | source-shape | `overlay002` | `0x7c` | 3 | 0 | `021ba6cc` | `arm/2 calls/1 branches/3S/0N` |
| `S-018` | source-shape | `overlay002` | `0x78` | 3 | 0 | `021ba654` | `arm/2 calls/1 branches/3S/0N` |
| `S-019` | source-shape | `overlay002` | `0x158` | 2 | 0 | `022a096c` | `arm/11 calls/2 branches/2S/0N` |
| `S-020` | source-shape | `overlay002` | `0x150` | 2 | 0 | `0224f5fc` | `arm/9 calls/8 branches/4S/0N` |
| `S-021` | source-shape | `overlay002` | `0x118` | 2 | 0 | `02255e54` | `arm/6 calls/6 branches/5S/0N` |
| `S-022` | source-shape | `overlay002` | `0x100` | 2 | 0 | `02249818` | `arm/7 calls/6 branches/4S/0N` |
| `S-023` | source-shape | `overlay002` | `0xe4` | 2 | 0 | `021fd584` | `arm/1 calls/3 branches/3S/0N` |
| `S-024` | source-shape | `overlay002` | `0xe0` | 2 | 0 | `02262fd0` | `arm/2 calls/4 branches/3S/0N` |
| `S-025` | source-shape | `overlay002` | `0xdc` | 2 | 0 | `022482d0` | `arm/4 calls/4 branches/4S/0N` |
| `S-026` | source-shape | `overlay002` | `0xc0` | 2 | 0 | `021f0df4` | `arm/3 calls/1 branches/4S/0N` |
| `S-027` | source-shape | `overlay002` | `0xbc` | 2 | 0 | `021ba430` | `arm/3 calls/4 branches/3S/0N` |
| `S-028` | source-shape | `overlay002` | `0xb8` | 2 | 0 | `021eb070` | `arm/1 calls/1 branches/3S/0N` |
| `S-029` | source-shape | `overlay002` | `0xb4` | 2 | 0 | `0221eda8` | `arm/2 calls/0 branches/3S/0N` |
| `S-030` | source-shape | `overlay002` | `0xa8` | 2 | 0 | `0224b0b0` | `arm/4 calls/4 branches/3S/0N` |
| `S-031` | source-shape | `overlay002` | `0xa4` | 2 | 0 | `0224d0f8` | `arm/3 calls/3 branches/3S/0N` |
| `S-032` | source-shape | `overlay002` | `0xa4` | 2 | 0 | `02250d9c` | `arm/5 calls/0 branches/2S/0N` |
| `S-033` | source-shape | `overlay002` | `0xa0` | 2 | 0 | `0224a28c` | `arm/3 calls/3 branches/3S/0N` |
| `S-034` | source-shape | `overlay002` | `0x9c` | 2 | 0 | `022507c0` | `arm/3 calls/3 branches/3S/0N` |
| `S-035` | source-shape | `overlay002` | `0x9c` | 2 | 0 | `022577dc` | `arm/4 calls/2 branches/3S/0N` |
| `S-036` | source-shape | `overlay002` | `0x98` | 2 | 0 | `022b9388` | `arm/5 calls/1 branches/3S/0N` |
| `S-037` | source-shape | `overlay002` | `0x94` | 2 | 0 | `02205548` | `arm/3 calls/1 branches/0S/0N` |
| `S-038` | source-shape | `overlay002` | `0x90` | 2 | 0 | `021bd45c` | `arm/3 calls/2 branches/3S/0N` |
| `S-039` | source-shape | `overlay002` | `0x88` | 2 | 0 | `02249790` | `arm/2 calls/2 branches/3S/0N` |
| `S-040` | source-shape | `overlay002` | `0x7c` | 2 | 0 | `021bd364` | `arm/2 calls/1 branches/3S/0N` |
| `S-041` | source-shape | `overlay002` | `0x7c` | 2 | 0 | `021ee44c` | `arm/1 calls/5 branches/1S/0N` |
| `S-042` | source-shape | `overlay002` | `0x74` | 2 | 0 | `021ba5e0` | `arm/2 calls/1 branches/3S/0N` |
| `S-043` | source-shape | `overlay002` | `0x74` | 2 | 0 | `022662e4` | `arm/2 calls/1 branches/3S/0N` |
| `S-044` | source-shape | `overlay002` | `0x74` | 2 | 0 | `02281a74` | `arm/2 calls/0 branches/3S/0N` |
| `S-045` | source-shape | `overlay002` | `0x74` | 2 | 0 | `022952dc` | `arm/2 calls/1 branches/2S/0N` |
| `S-046` | source-shape | `overlay000,overlay002` | `0x6c` | 2 | 0 | `021ab1b0` | `arm/0 calls/0 branches/4S/0N` |
| `S-047` | source-shape | `overlay002` | `0x6c` | 2 | 0 | `02212b58` | `arm/3 calls/2 branches/0S/0N` |
| `S-048` | source-shape | `overlay002` | `0x6c` | 2 | 0 | `02228a9c` | `arm/2 calls/1 branches/2S/0N` |
| `S-049` | source-shape | `overlay002` | `0x6c` | 2 | 0 | `0223163c` | `arm/4 calls/2 branches/0S/0N` |
| `S-050` | source-shape | `overlay002` | `0x6c` | 2 | 0 | `022880ec` | `arm/3 calls/0 branches/0S/0N` |
| `S-051` | source-shape | `overlay002` | `0x68` | 2 | 0 | `021d1690` | `arm/2 calls/1 branches/1S/0N` |
| `S-052` | source-shape | `overlay002` | `0x68` | 2 | 0 | `021d1820` | `arm/2 calls/1 branches/1S/0N` |
| `S-053` | source-shape | `overlay002` | `0x68` | 2 | 0 | `022169a0` | `arm/1 calls/2 branches/3S/0N` |
| `S-054` | source-shape | `overlay002` | `0x60` | 2 | 0 | `0226baf8` | `arm/1 calls/2 branches/3S/0N` |
| `S-055` | source-shape | `overlay002` | `0x5c` | 2 | 0 | `021bc1d0` | `arm/1 calls/1 branches/2S/0N` |
| `S-056` | source-shape | `overlay002` | `0x58` | 2 | 0 | `02248434` | `arm/2 calls/1 branches/2S/0N` |
| `S-057` | source-shape | `overlay002` | `0x58` | 2 | 0 | `02259990` | `arm/2 calls/0 branches/2S/0N` |
| `S-058` | source-shape | `overlay002` | `0x54` | 2 | 0 | `022aaf38` | `arm/4 calls/0 branches/1S/0N` |
| `S-059` | source-shape | `overlay002` | `0x48` | 2 | 0 | `02200400` | `arm/2 calls/1 branches/1S/0N` |
| `S-060` | source-shape | `overlay002` | `0x48` | 2 | 0 | `022016bc` | `arm/0 calls/2 branches/1S/0N` |
| `S-061` | source-shape | `overlay002` | `0x48` | 2 | 0 | `0226aea8` | `arm/0 calls/0 branches/1S/0N` |
| `S-062` | source-shape | `overlay002` | `0x44` | 2 | 0 | `021f9910` | `arm/2 calls/0 branches/0S/0N` |
| `S-063` | source-shape | `overlay002` | `0x3c` | 2 | 0 | `02201e38` | `arm/0 calls/1 branches/0S/0N` |
| `S-064` | source-shape | `main` | `0x7c` | 3 | 0 | `020234f8` | `arm/4 calls/1 branches/2S/0N` |
| `S-065` | source-shape | `main` | `0x28` | 3 | 0 | `020a9764` | `arm/1 calls/1 branches/0S/0N` |
| `S-066` | source-shape | `main` | `0x1e8` | 2 | 0 | `02003400` | `arm/1 calls/20 branches/7S/0N` |
| `S-067` | source-shape | `main` | `0x1d0` | 2 | 0 | `0200f4b4` | `arm/4 calls/30 branches/2S/0N` |
| `S-068` | source-shape | `main` | `0x148` | 2 | 0 | `0208571c` | `arm/2 calls/2 branches/3S/0N` |
| `S-069` | source-shape | `main` | `0x124` | 2 | 0 | `020a84c8` | `arm/1 calls/12 branches/0S/0N` |
| `S-070` | source-shape | `main` | `0x110` | 2 | 0 | `02061798` | `arm/4 calls/5 branches/3S/0N` |
| `S-071` | source-shape | `main` | `0xe8` | 2 | 0 | `0207634c` | `arm/12 calls/2 branches/2S/0N` |
| `S-072` | source-shape | `main` | `0xd4` | 2 | 0 | `020619b8` | `arm/3 calls/3 branches/2S/0N` |
| `S-073` | source-shape | `main` | `0xc0` | 2 | 0 | `02077ecc` | `arm/4 calls/4 branches/0S/0N` |
| `S-074` | source-shape | `main` | `0xa4` | 2 | 0 | `02046498` | `arm/1 calls/15 branches/1S/0N` |
| `S-075` | source-shape | `main` | `0xa4` | 2 | 0 | `0209e308` | `arm/2 calls/0 branches/3S/0N` |
| `S-076` | source-shape | `main` | `0x8c` | 2 | 0 | `0208cfa4` | `arm/1 calls/4 branches/3S/0N` |
| `S-077` | source-shape | `main` | `0x8c` | 2 | 0 | `0208e014` | `arm/0 calls/8 branches/1S/0N` |
| `S-078` | source-shape | `main` | `0x80` | 2 | 0 | `0208df94` | `arm/0 calls/8 branches/2S/0N` |
| `S-079` | source-shape | `main` | `0x74` | 2 | 0 | `02052870` | `arm/2 calls/3 branches/0S/0N` |
| `S-080` | source-shape | `main` | `0x74` | 2 | 0 | `02062ba4` | `arm/3 calls/0 branches/0S/0N` |
| `S-081` | source-shape | `main` | `0x74` | 2 | 0 | `02077e58` | `arm/4 calls/0 branches/1S/0N` |
| `S-082` | source-shape | `main` | `0x70` | 2 | 0 | `02023f7c` | `arm/3 calls/1 branches/2S/0N` |
| `S-083` | source-shape | `main` | `0x70` | 2 | 0 | `0206b88c` | `arm/3 calls/0 branches/2S/0N` |
| `S-084` | source-shape | `main` | `0x6c` | 2 | 0 | `02055a18` | `arm/2 calls/3 branches/1S/0N` |
| `S-085` | source-shape | `main` | `0x68` | 2 | 0 | `0200a19c` | `arm/2 calls/1 branches/1S/0N` |
| `S-086` | source-shape | `main` | `0x60` | 2 | 0 | `0201f25c` | `arm/5 calls/0 branches/4S/0N` |
| `S-087` | source-shape | `main` | `0x60` | 2 | 0 | `02023e58` | `arm/3 calls/2 branches/0S/0N` |
| `S-088` | source-shape | `main` | `0x60` | 2 | 0 | `020685c8` | `arm/2 calls/3 branches/2S/0N` |
| `S-089` | source-shape | `main` | `0x60` | 2 | 0 | `0208fd30` | `arm/3 calls/1 branches/1S/0N` |
| `S-090` | source-shape | `main` | `0x5c` | 2 | 0 | `02062b48` | `arm/2 calls/0 branches/0S/0N` |
| `S-091` | source-shape | `main` | `0x58` | 2 | 0 | `0208f38c` | `arm/2 calls/1 branches/3S/0N` |
| `S-092` | source-shape | `main` | `0x54` | 2 | 0 | `02003ac0` | `arm/2 calls/1 branches/1S/0N` |
| `S-093` | source-shape | `main` | `0x4c` | 2 | 0 | `0203db24` | `arm/2 calls/2 branches/0S/0N` |
| `S-094` | source-shape | `main` | `0x4c` | 2 | 0 | `020551b8` | `arm/1 calls/0 branches/2S/0N` |
| `S-095` | source-shape | `main` | `0x4c` | 2 | 0 | `0208f1c4` | `arm/2 calls/1 branches/2S/0N` |
| `S-096` | source-shape | `main` | `0x48` | 2 | 0 | `02055128` | `arm/1 calls/0 branches/2S/0N` |
| `S-097` | source-shape | `main` | `0x44` | 2 | 0 | `02005188` | `arm/1 calls/0 branches/2S/0N` |
| `S-098` | source-shape | `main` | `0x44` | 2 | 0 | `0201a3ec` | `arm/4 calls/2 branches/0S/0N` |
| `S-099` | source-shape | `main` | `0x44` | 2 | 0 | `0207d4dc` | `arm/1 calls/4 branches/0S/0N` |
| `S-100` | source-shape | `main` | `0x44` | 2 | 0 | `0209bb60` | `arm/2 calls/1 branches/2S/0N` |
| `S-101` | source-shape | `main` | `0x38` | 2 | 0 | `02097004` | `arm/1 calls/0 branches/0S/0N` |
| `S-102` | source-shape | `main` | `0x34` | 2 | 0 | `02054c30` | `arm/2 calls/0 branches/0S/0N` |
| `S-103` | source-shape | `main` | `0x34` | 2 | 0 | `020905a8` | `arm/0 calls/0 branches/2S/0N` |
| `S-104` | source-shape | `main` | `0x28` | 2 | 0 | `0203f718` | `arm/2 calls/0 branches/0S/0N` |
| `S-105` | source-shape | `main` | `0x1c` | 2 | 0 | `020a71e4` | `arm/1 calls/0 branches/1S/0N` |
| `S-106` | source-shape | `main` | `0xc` | 2 | 0 | `0206be1c` | `arm/0 calls/0 branches/0S/0N` |
| `S-107` | source-shape | `overlay004,overlay005,overlay008,overlay009,overlay014,overlay016` | `0x118` | 6 | 0 | `021c9dd4` | `arm/1 calls/2 branches/1S/0N` |
| `S-108` | source-shape | `overlay004` | `0x13c` | 3 | 0 | `021cb63c` | `arm/11 calls/0 branches/2S/0N` |
| `S-109` | source-shape | `overlay004` | `0xd4` | 3 | 0 | `021cb568` | `arm/3 calls/0 branches/4S/0N` |
| `S-110` | source-shape | `overlay016,overlay017,overlay019` | `0xcc` | 3 | 0 | `021b75c8` | `arm/3 calls/1 branches/2S/0N` |
| `S-111` | source-shape | `overlay004` | `0xbc` | 3 | 0 | `021cb778` | `arm/2 calls/0 branches/0S/0N` |
| `S-112` | source-shape | `overlay010,overlay015` | `0x224` | 2 | 0 | `021b3774` | `arm/12 calls/14 branches/1S/0N` |
| `S-113` | source-shape | `overlay017,overlay019` | `0x20c` | 2 | 0 | `021b7ba0` | `arm/6 calls/14 branches/3S/0N` |
| `S-114` | source-shape | `overlay010,overlay015` | `0x1a8` | 2 | 0 | `021b2630` | `arm/15 calls/7 branches/0S/0N` |
| `S-115` | source-shape | `overlay012,overlay013` | `0x138` | 2 | 0 | `021ca6dc` | `arm/5 calls/13 branches/2S/0N` |
| `S-116` | source-shape | `overlay016,overlay019` | `0x110` | 2 | 0 | `021b60cc` | `arm/7 calls/0 branches/1S/0N` |
| `S-117` | source-shape | `overlay004` | `0x10c` | 2 | 0 | `021cb834` | `arm/8 calls/1 branches/2S/0N` |
| `S-118` | source-shape | `overlay010,overlay015` | `0xe4` | 2 | 0 | `021b2514` | `arm/0 calls/3 branches/0S/0N` |
| `S-119` | source-shape | `overlay006` | `0xdc` | 2 | 0 | `021c426c` | `arm/2 calls/2 branches/2S/0N` |
| `S-120` | source-shape | `overlay004` | `0xa8` | 2 | 0 | `021d4190` | `arm/2 calls/2 branches/1S/0N` |
| `S-121` | source-shape | `overlay004` | `0xa4` | 2 | 0 | `021cb940` | `arm/6 calls/1 branches/0S/0N` |
| `S-122` | source-shape | `overlay016,overlay019` | `0x98` | 2 | 0 | `021b2a8c` | `arm/3 calls/0 branches/0S/0N` |
| `S-123` | source-shape | `overlay011` | `0x90` | 2 | 0 | `021d1080` | `arm/1 calls/1 branches/3S/0N` |
| `S-124` | source-shape | `overlay006` | `0x88` | 2 | 0 | `021c4028` | `arm/1 calls/5 branches/0S/0N` |
| `S-125` | source-shape | `overlay010,overlay015` | `0x84` | 2 | 0 | `021b27d8` | `arm/2 calls/0 branches/0S/0N` |
| `S-126` | source-shape | `overlay016,overlay019` | `0x84` | 2 | 0 | `021b7694` | `arm/2 calls/1 branches/0S/0N` |
| `S-127` | source-shape | `overlay004` | `0x7c` | 2 | 0 | `021d43a0` | `arm/2 calls/1 branches/2S/0N` |
| `S-128` | source-shape | `overlay016` | `0x78` | 2 | 0 | `021b287c` | `arm/3 calls/3 branches/0S/0N` |
| `S-129` | source-shape | `overlay020` | `0x64` | 2 | 0 | `021ab364` | `arm/3 calls/0 branches/0S/0N` |
| `S-130` | source-shape | `overlay010,overlay015` | `0x64` | 2 | 0 | `021b2490` | `arm/1 calls/0 branches/0S/0N` |
| `S-131` | source-shape | `overlay004` | `0x4c` | 2 | 0 | `021d4870` | `arm/0 calls/1 branches/1S/0N` |
| `S-132` | source-shape | `overlay010,overlay015` | `0x48` | 2 | 0 | `021b28a8` | `arm/0 calls/3 branches/0S/0N` |
| `S-133` | source-shape | `overlay006,overlay007` | `0x48` | 2 | 0 | `021c1958` | `arm/2 calls/1 branches/1S/0N` |
| `S-134` | source-shape | `overlay004,overlay009` | `0x3c` | 2 | 0 | `021d8d1c` | `arm/0 calls/2 branches/1S/0N` |
| `S-135` | source-shape | `overlay012,overlay013` | `0x14` | 2 | 0 | `021c9d8c` | `arm/1 calls/0 branches/2S/0N` |

## Method and boundaries

- Candidate membership comes from the current `python tools/wall_aware_headroom.py --json` / `--coercible` pool and the 6,117 paths recorded in `cmatch-worklist.md`. EUR source units only; no USA/JPN ports were added.
- The source-shape signature parses committed `.s` instruction text: ARM/Thumb mode, EUR delinks byte span, normalized opcode/operand sequence, calls, conditional branches, and literal-pool symbol/constant counts. Register names, numeric constants, local labels, and symbol spellings are normalized so sibling shapes can cluster despite address/allocator differences.
- The anchor view uses the repository’s exact relocation-signature primitive (`tools/find_pattern_clusters.py`) but supplies a C-only matched-range map. This prevents complete `.s`/GLOBAL_ASM units from being mislabeled as C anchors. It is build-free and does not run a compiler or `ninja`.
- `docs/research/c-match-worklist.json` cluster IDs were used as a prior grouping cross-check. The named family queues and their address tokens were subtracted before ranking; `cmatch-worklist.md` was used as the candidate source, not treated as an existing family catalog.
- Brief 569’s `dsd sig` test is deliberately not repeated as the primary method: it was weak (6/60, boolean-only, no addresses). If a later operator uses it, use it only to confirm a suspected structural pair.
- Honest ambiguity: normalized opcode families can over-group generic wrappers, and empty-relocation groups are especially weak. Treat the exemplar and member list as a read/disassemble queue; do not assume byte identity until a C draft and the normal gate verify it.
- Active-lane caveat: briefs 654 and 655 are shipping from `overlay002` and `main` while this read-only census runs. Re-run the classifier and refresh family membership after those waves land.

No source, config, or tool file was changed for this census; no build was run.
