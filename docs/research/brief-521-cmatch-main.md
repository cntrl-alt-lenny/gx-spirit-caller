[//]: # (markdownlint-disable MD013)

# Brief 521 - MAIN MED c-match wave

Branch: `codex/cmatch-main-521`

Scope: MAIN-only c-match lane from `docs/research/campaign-analytics/safe-queue-v3.md` section 4, filtered to MED rows and staying off every overlay. Brief 520 had already worked MAIN rows 13-32 from this same queue, so this wave started at the next address-sorted unconverted MED candidate rather than re-testing known parks.

## Outcome

- Fresh queue entries attempted: **1**
- EUR matches accepted: **0**
- USA/JPN ports kept: **0**
- Avalanche parked: **1**
- Reshape parked: **0**
- Build parked: **0**
- Latent main-source repair: **3 USA files restored**

No `src/main` or `config/*/arm9/delinks.txt` edits were kept. The candidate was reverted immediately after the containment wall, so there were no regional ports to attempt.

The final 3-region gate also exposed a pre-existing USA main delink/source mismatch from the June 28 neighbor-file sweep: `config/usa/arm9/delinks.txt` still referenced three source files that were absent from the tree. This PR restores only those expected `src/usa/main` files:

- `src/usa/main/func_02005be0.c`
- `src/usa/main/func_0200620c.c`
- `src/usa/main/func_020062f8.c`

After restoration, the main-delink source-reference scan reported zero missing targets for EUR, USA, and JPN.

## Prior row boundary

Brief 520 already attempted MAIN ranks 13-32 from safe-queue v3. That block accepted only `02031afc`; the remaining rows were parked as either containment avalanches or contained reshape walls. This wave therefore skipped those known results and began with rank 33.

## Parked candidate

| Addr | Queue rank | Tier | Size | Result | One-line reason |
|---|---:|---|---:|---|---|
| `02085460` | 33 | MED | 68 | Parked | `tools/containment_check.py` reported an ARM9-wide avalanche: 163,260 diff bytes across 23,675 runs, with the first outside run in `src/main/Entry.c`. |

The attempted reshape used the prepared clone of `0208541c` from `docs/research/c-match-prep/02085460.c`:

```c
void func_02085460(unsigned char *obj, int idx, int val) {
    unsigned short *slot = (unsigned short *)(obj + idx * 0x90 + 0x56);
    unsigned short w = *slot;
    *slot = (unsigned short)((w & ~0xf) | val);
}
```

The function built, but failed the containment gate before any objdiff or regional port was worthwhile:

```text
containment_check: eur  candidate=[0x02085460, 0x020854a4)  (resolved from delinks.txt (addr 0x02085460 -> src/main/func_02085460.c))
  built:   build/eur/build/arm9.bin  (1059936 bytes)
  extract: extract/eur/arm9/arm9.bin  (1059936 bytes)
  diff: 163260 byte(s) across 23675 run(s)
  23664 run(s) OUTSIDE the candidate range:
    0x020008f8-0x020008f9  owner: src/main/Entry.c
    0x02000900-0x02000901  owner: src/main/Entry.c
    0x02001934-0x02001935  owner: src/main/func_020018d4.s
    0x020019e4-0x020019e5  owner: src/main/func_0200197c.s
    0x02001a70-0x02001a71  owner: src/main/func_02001a34.s
    ... and 23659 more
AVALANCHE
```

## Takeaway

The first fresh MED-main tail candidate after the brief-520 block hit the same early-ARM9 avalanche signature as most of rows 13-32. That makes the immediate MAIN MED tail low-yield for manual c-match grinding until the layout/containment issue is understood better.

## Verification

Final SHA gates:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Other checks:

```text
python3.13 tools/generate_research_index.py --check
docs/research/README.md is current.

git diff --check
OK
```
