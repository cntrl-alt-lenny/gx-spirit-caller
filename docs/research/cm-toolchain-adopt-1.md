[//]: # (markdownlint-disable MD013 MD041)

# cm-toolchain-adopt-1 — m2c pin adoption + dsd leg (blocked again)

**Item:** `cm-toolchain-adopt-1` (scaffolder, effort MEDIUM). Follow-up to
`q-toolchain-repin-eval` (#1512), which evaluated three drifted toolchain pins and produced
three verdicts: m2c ADOPT, decomp-permuter DECLINE (no evidence either way), dsd NOT ATTEMPTED
(blocked by live contention). This round executes the ADOPT verdict and gives the dsd leg a
second window.

**Framing correction carried in from the brain, not repeated here as a headline:** the prior
round's incidental "30 unmatched functions project-wide" census measured delink gaps — real,
and a genuine small closeable target — not the natural-C campaign headline (~16.5% EUR /
11.84% USA), which is a different axis (a `.s` file is byte-matched by construction, not
decompiled C). PR number 1512's own doc holds that framing; `q-metric-canon-guard` (Codex
Decomper) owns correcting it in place, not touched here.

## Part 1 — m2c pin ADOPTED: `ce052171` → `19f2ddb2`

`tools/m2c_bootstrap.py`'s `M2C_COMMIT` is now `19f2ddb22dcf5161c27b7eae62f142e697ae895f`.
This is draft-generation tooling for the cold-RE track only — it feeds `m2c_feed.py`'s output
into a comprehension draft that a decomper hand-iterates from; it is never in the build graph
and cannot affect a single shipped byte. `git diff` on the pin file:

```diff
diff --git a/tools/m2c_bootstrap.py b/tools/m2c_bootstrap.py
index 26c1a6137..656201b34 100755
--- a/tools/m2c_bootstrap.py
+++ b/tools/m2c_bootstrap.py
@@ -24,8 +24,11 @@ from pathlib import Path

 ROOT = Path(__file__).resolve().parent.parent
 M2C_REPO_URL = "https://github.com/matt-kempster/m2c.git"
-# Pinned 2026-06-08. To bump: `git -C tools/_vendor/m2c rev-parse HEAD`.
-M2C_COMMIT = "ce05217168449189eea615d01e468868ebb16d24"
+# Pinned 2026-08-18 (q-toolchain-repin-eval / cm-toolchain-adopt-1, PR #1512):
+# adopted for a real stack-argument-by-reference misresolution fix in m2c's
+# ARM backend, verified on the project's own 8-function draft panel. To
+# bump: `git -C tools/_vendor/m2c rev-parse HEAD`.
+M2C_COMMIT = "19f2ddb22dcf5161c27b7eae62f142e697ae895f"
 M2C_VENDOR_DIR = ROOT / "tools" / "_vendor" / "m2c"
 M2C_PIP_DEPS = ("pycparser",)
```

### Same 8-function panel, re-run at the adopted pin (fresh evidence, not pointing back at #1512)

`tools/m2c_bootstrap.py` re-pinned cleanly (`m2c present at ce0521716844 (pin is
19f2ddb22dcf); re-pinning.` → `HEAD is now at 19f2ddb Fix generating initializers for u128`).
All 8 panel functions still produce a draft at the new pin (`--m2c`, no `--context`, region
`eur`):

| Function | Lines | vs. old pin (`ce052171`, from #1512) |
|---|---:|---|
| `func_ov004_021dc474` | 28 | **differs** — fixed stack-arg-by-ref misresolution |
| `func_ov004_021dc0ac` | 26 | identical |
| `func_ov004_021dd648` | 536 | identical |
| `func_01ff8180` | 20 | **differs** — drops one spurious unreferenced extern |
| `func_01ff8624` | 12 | identical |
| `func_ov001_021c9d60` | 56 | identical |
| `func_ov014_021b2280` | 95 | **differs** — same stack-arg-by-ref fix as `021dc474` |
| `func_ov004_021dcbcc` | 19 | identical |

Line counts match #1512's own record exactly (28/26/536/20/12/56/95/19), and the 3 that
differ are the same 3 functions #1512 already diffed byte-for-byte against the old pin — this
run reproduces that result at the pin now actually committed, rather than asserting it from
memory. Full drafts (all 8, verbatim):

```c
// func_ov004_021dc474.c — DIFFERS from old pin
s32 func_020b3870(s32, s32);                        /* extern */
s16 func_ov004_021dbd6c(u16);                       /* extern */
s32 func_ov004_021dbd84(s32);                       /* extern */
? func_ov004_021dbe68(void *, s32 *, s16);          /* extern */
extern ? data_ov004_02291630;

s16 func_ov004_021dc474(void *arg0) {
    s32 sp0;
    s16 temp_r4;
    s16 temp_r7;
    void *temp_r4_2;

    arg0->unk0 = (s8) data_ov004_02291630.unk19;
    arg0->unk1 = 1;
    temp_r4 = (s16) data_ov004_02291630.unk4;
    func_ov004_021dbe68(arg0 + 6, data_ov004_02291630.unk0, temp_r4);
    arg0->unk2 = func_ov004_021dbd6c((u16) temp_r4);
    temp_r7 = func_020b3870((s16) (temp_r4 + 6) + 1, 2) * 2;
    arg0->unk4 = func_ov004_021dbd6c((u16) temp_r7);
    temp_r4_2 = arg0 + temp_r7;
    *(arg0 + temp_r7) = 0x60;
    temp_r4_2->unk1 = 0;
    temp_r4_2->unk4 = func_ov004_021dbd6c();
    sp0 = func_ov004_021dbd84(0xE);
    func_ov004_021dbe68(temp_r4_2 + 6, &sp0, 4);
    temp_r4_2->unk2 = func_ov004_021dbd6c(4U);
    return (s16) (temp_r7 + 0xA);
}
```

```c
// func_ov004_021dc0ac.c — identical to old pin
void func_ov004_021dc0ac(u32 *arg1) {
    s32 var_r5;
    u32 *var_r1;
    u32 var_r6;
    u32 var_r7;

    var_r1 = arg1;
    var_r6 = 0;
    do {
        var_r7 = var_r6;
        var_r5 = 0;
loop_2:
        if (var_r7 & 1) {
            var_r7 = (var_r7 >> 1) ^ M2C_ERROR(/* Read from unset register $pc */)->unk2C;
        } else {
            var_r7 = var_r7 >> 1;
        }
        var_r5 += 1;
        if (var_r5 < 8) {
            goto loop_2;
        }
        *var_r1 = var_r7;
        var_r1 += 4;
        var_r6 += 1;
    } while ((s32) var_r6 < (s32) M2C_ERROR(/* Read from unset register $pc */)->unkC);
}
```

```c
// func_ov004_021dd648.c — identical to old pin (largest panel member, 536 lines)
s32 func_020b3870(s32, s32);                        /* extern */
? func_ov004_021dbc78(s32, ? *);                    /* extern */
? func_ov004_021dbc80(? *);                         /* extern */
s32 func_ov004_021dbd1c(u16);                       /* extern */
s16 func_ov004_021dbd6c(s32);                       /* extern */
s32 func_ov004_021dbd84(? *);                       /* extern */
? func_ov004_021dbdbc();                            /* extern */
s32 func_ov004_021dbdc4(s32, ? **, s32);            /* extern */
s32 func_ov004_021dbdd0(s32, s32, s32);             /* extern */
s32 func_ov004_021dbdd8(s32, s32 *, s32, s32 *, s32); /* extern */
s32 func_ov004_021dbdf4(s32, ? *, s32, s32, s32 *); /* extern */
u16 func_ov004_021dbe40(s32, ? **, s32, s32, ? *, s32 *); /* extern */
? func_ov004_021dbe5c(? **, s32, s32);              /* extern */
s32 func_ov004_021dbea0();                          /* extern */
s32 func_ov004_021dbecc(? *, s32, ? *);             /* extern */
s32 func_ov004_021dc7bc(s32, ? **, ? **, s32);      /* extern */
s32 func_ov004_021dd150(s32, ? **, s32 *, ? **, s32); /* extern */
? func_ov004_021dd20c(s32);                         /* extern */
? func_ov004_021dd244(s32, ? **, s32);              /* extern */
s32 func_ov004_021dd27c(? **);                      /* extern */
s32 func_ov004_021dd2c8(? **);                      /* extern */
s32 func_ov004_021dd374(s32);                       /* extern */
s32 func_ov004_021dd584();                          /* extern */
? func_ov004_021dd590(s32);                         /* extern */
? func_ov004_021dd59c(s32);                         /* extern */
? func_ov004_021dd5f0();                            /* extern */
? *func_ov004_021dd628(s32, s32);                   /* extern */
? func_ov004_021de23c();                            /* extern */
? **func_ov004_021de250(s32);                       /* extern */
? func_ov004_021de280(s16);                         /* extern */
s32 func_ov004_021de288(? **, ? **);                /* extern */
s32 func_ov004_021de46c(? ***);                     /* extern */
extern s32 data_ov004_0220a294;
extern ? data_ov004_0220a298;
extern ? **data_ov004_02291608;
extern ? data_ov004_02291610;
extern ? data_ov004_02291618;
extern s32 data_ov004_02291630;

s32 func_ov004_021dd648(s32 arg0) {
    ? *spC8;
    ? *spB8;
    ? *sp7C;
    ? *sp64;
    s32 sp60;
    ? *sp5C;
    s32 sp58;
    s32 sp54;
    ? sp4C;
    s32 sp48;
    ? sp40;
    s32 sp3C;
    s32 sp38;
    ? sp34;
    ? sp30;
    s32 sp2C;
    s32 sp28;
    s32 sp24;
    ? **sp20;
    ? *sp1C;
    s32 sp18;
    s32 sp14;
    s32 sp10;
    s32 spC;
    s32 sp8;
    ? ***temp_r5;
    ? **temp_r0_10;
    ? **temp_r0_16;
    ? **temp_r0_4;
    ? **temp_r0_7;
    ? *temp_r0_12;
    s16 temp_r0_2;
    s16 temp_r7;
    s16 var_r4_2;
    s32 temp_r0_11;
    s32 temp_r0_13;
    s32 temp_r0_14;
    s32 temp_r0_15;
    s32 temp_r0_17;
    s32 temp_r0_18;
    s32 temp_r0_3;
    s32 temp_r0_5;
    s32 temp_r0_6;
    s32 temp_r0_8;
    s32 temp_r0_9;
    s32 temp_r1;
    s32 temp_r2;
    s32 var_r4;
    s32 var_r4_3;
    s32 var_r4_4;
    u16 temp_r2_2;
    u32 temp_r0;

    sp8 = arg0;
    sp30.unk0 = (u16) data_ov004_0220a298.unk0;
    sp30.unk2 = (u16) data_ov004_0220a298.unk2;
    sp14 = 0;
    sp34.unk0 = 0;
    sp34.unk2 = 0;
    sp38 = 1;
    sp3C = 0;
    sp1C = NULL;
    func_ov004_021dbe5c(&sp64, sp14, 0x18);
    sp30.unk0 = (u16) *(sp8 + &data_ov004_0220a298);
    if ((s16) sp30.unk0 == -1) {
        sp30.unk0 = 0xAU;
    }
    sp30.unk4 = (s16) *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk354);
    if (sp30.unk4 == -1) {
        sp30.unk4 = 0xA;
    }
    sp30.unk2 = (u16) *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk340);
    if ((s16) sp30.unk2 == -1) {
        sp30.unk2 = 0x64U;
    }
    sp30.unk6 = (s16) *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk328);
    if (sp30.unk6 == -1) {
        sp30.unk6 = 0x64;
    }
    temp_r0_2 = *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk314);
    sp10 = (s32) temp_r0_2;
    if (temp_r0_2 == -1) {
        sp10 = M2C_ERROR(/* Read from unset register $pc */)->unk304;
    }
    func_ov004_021dd59c(sp8);
    if ((data_ov004_02291630.unk8 & 1) != 1) {
        func_ov004_021dd590(0x13);
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk2F0) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    var_r4 = 0;
    func_ov004_021dd20c(0);
    temp_r7 = (s16) sp30.unk2;
    temp_r5 = M2C_ERROR(/* Read from unset register $pc */)->unk2CC;
loop_13:
    if (*temp_r5 != NULL) {
        func_ov004_021de23c();
        *temp_r5 = NULL;
    }
    if (func_ov004_021de46c(temp_r5) == -1) {
        *(sp8 + &data_ov004_02291630) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    temp_r0_3 = func_ov004_021dd2c8(*temp_r5);
    if (temp_r0_3 == 4) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk28C) = 2;
        func_ov004_021dd5f0();
        return -1;
    }
    if (temp_r0_3 != 0) {
        if (var_r4 >= (s32) (s16) sp30.unk0) {
            *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk268) = 1;
            func_ov004_021dd5f0();
            return -1;
        }
        func_ov004_021de280(temp_r7);
        var_r4 = (s32) (s16) (var_r4 + 1);
        goto loop_13;
    }
    func_ov004_021dd20c(1);
    func_ov004_021dbe5c(&sp7C, 0, 0x3C);
    if (func_ov004_021dd27c(&sp7C) != 0) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk228) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    temp_r0_4 = func_ov004_021de250(0x58);
    data_ov004_02291610.unk0 = temp_r0_4;
    if (temp_r0_4 == NULL) {
        *(sp8 + &data_ov004_02291630) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    func_ov004_021dbe5c(temp_r0_4, 0, 0x58);
    var_r4_2 = 0;
    if ((s32) (s16) sp30.unk0 > 0) {
loop_29:
        temp_r0_5 = func_ov004_021de288(&sp7C, data_ov004_02291610.unk0);
        if (temp_r0_5 == -1) {
            *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk1C4) = 0xF;
            func_ov004_021dd5f0();
            return -1;
        }
        if (((temp_r0_5 == 0) && ((temp_r0_5 != 0) || (*data_ov004_02291608 == (? *)1))) || (func_ov004_021de280(temp_r7), var_r4_2 += 1, ((s32) var_r4_2 >= (s32) (s16) sp30.unk0))) {
            goto block_35;
        }
        goto loop_29;
    }
block_35:
    if (var_r4_2 == (s16) sp30.unk0) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk17C) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    if (func_ov004_021dbecc(&data_ov004_02291610, -0x100, &data_ov004_02291610) != 0) {
        func_ov004_021dd590(0xC);
        *(sp8 + &data_ov004_02291630) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    func_ov004_021dd5f0();
    func_ov004_021dd244(3, &sp64, sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk140);
    temp_r0_6 = func_ov004_021dbdd0(2, 2, 0);
    data_ov004_0220a294 = temp_r0_6;
    if (temp_r0_6 < 0) {
        *(sp8 + &data_ov004_02291630) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    if (func_ov004_021dbdd8(temp_r0_6, M2C_ERROR(/* Read from unset register $pc */)->unk110, 1, &sp38, 4) < 0) {
        func_ov004_021dd590(0xB);
        *(sp8 + &data_ov004_02291630) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    func_ov004_021dbe5c(&sp5C, 0, 8);
    sp5C.unk1 = 2;
    sp60 = func_ov004_021dbd84(M2C_ERROR(/* Read from unset register $pc */)->unkC8);
    sp30.unk2E = func_ov004_021dbd6c(M2C_ERROR(/* Read from unset register $pc */)->unkD0);
    if (func_ov004_021dbdc4(*M2C_ERROR(/* Read from unset register $pc */)->unkBC, &sp5C, 8) < 0) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk98) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    sp28 = -1;
loop_46:
    sp20 = *M2C_ERROR(/* Read from unset register $pc */)->unk98;
    func_ov004_021dbe5c(&spB8, 0, 0x14);
    spC8 = &data_ov004_02291610;
    spB8 = &data_ov004_02291618;
    sp24 = func_020b3870(sp10, M2C_ERROR(/* Read from unset register $pc */)->unk88);
    temp_r1 = SECOND_REG(func_020b3870(sp10, M2C_ERROR(/* Read from unset register $pc */)->unk7C));
    spC = temp_r1;
    spC = temp_r1 * M2C_ERROR(/* Read from unset register $pc */)->unk74;
loop_47:
    if (sp14 != 1) {
        goto block_90;
    }
    if (data_ov004_02291630.unk18 == 1) {
        goto block_90;
    }
    if (data_ov004_0220a294 != -1) {
        func_ov004_021dbdbc();
    }
    data_ov004_0220a294 = sp28;
    if (func_ov004_021dbea0() != 0) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk374) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    temp_r0_7 = func_ov004_021de250(0x58);
    data_ov004_02291608 = temp_r0_7;
    if (temp_r0_7 == NULL) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk350) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
loop_59:
    if (data_ov004_02291608 != NULL) {
        func_ov004_021de23c();
        data_ov004_02291608 = NULL;
    }
    temp_r0_8 = func_ov004_021de46c(&data_ov004_02291608);
    sp2C = temp_r0_8;
    if (temp_r0_8 == -1) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk320) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    temp_r0_9 = func_ov004_021dd2c8(data_ov004_02291608);
    if (temp_r0_9 == 4) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk2FC) = 2;
        func_ov004_021dd5f0();
        return -1;
    }
    if (temp_r0_9 != 0) {
        if ((s32) var_r4_2 >= (s32) (s16) sp30.unk0) {
            *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk2D8) = 1;
            func_ov004_021dd5f0();
            return -1;
        }
        func_ov004_021de280(temp_r7);
        var_r4_2 += 1;
        goto loop_59;
    }
    if (sp2C == -1) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk2AC) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    temp_r0_10 = func_ov004_021de250(0x58);
    data_ov004_02291610.unk0 = temp_r0_10;
    if (temp_r0_10 == NULL) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk284) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    func_ov004_021dbe5c(temp_r0_10, 0, 0x58);
    var_r4_2 = 0;
    if ((s32) (s16) sp30.unk0 > 0) {
loop_74:
        temp_r0_11 = func_ov004_021de288(&sp7C, data_ov004_02291610.unk0);
        if (temp_r0_11 == -1) {
            *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk24C) = 0xF;
            func_ov004_021dd5f0();
            return -1;
        }
        if (((temp_r0_11 == 0) && ((temp_r0_11 != 0) || (**M2C_ERROR(/* Read from unset register $pc */)->unk230 == 1))) || (func_ov004_021de280(temp_r7), var_r4_2 += 1, ((s32) var_r4_2 >= (s32) (s16) sp30.unk0))) {
            goto block_80;
        }
        goto loop_74;
    }
block_80:
    if (var_r4_2 == (s16) sp30.unk0) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk204) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    temp_r0_12 = func_ov004_021dd628(data_ov004_02291630.unk10, data_ov004_02291630.unk14);
    sp1C = temp_r0_12;
    if (func_ov004_021dbecc(temp_r0_12, data_ov004_02291610.unk14, temp_r0_12) != 0) {
        func_ov004_021dd590(0xC);
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk1CC) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    data_ov004_02291630.unk18 = 1;
    func_ov004_021dd5f0();
    temp_r0_13 = func_ov004_021dbdd0(2, 2, 0);
    data_ov004_02291630.unk0 = temp_r0_13;
    if (temp_r0_13 < 0) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk198) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    if (func_ov004_021dbdd8(temp_r0_13, &data_ov004_0220a294, 1, &sp38, 4) < 0) {
        func_ov004_021dd590(0xB);
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk168) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    func_ov004_021dbe5c(&sp5C, 0, 8);
    sp5C.unk1 = 2;
    sp60 = func_ov004_021dbd84(sp1C);
    sp30.unk2E = func_ov004_021dbd6c(M2C_ERROR(/* Read from unset register $pc */)->unk14C);
    if (func_ov004_021dbdc4(data_ov004_0220a294, &sp5C, 8) < 0) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk11C) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
block_90:
    if (func_ov004_021dc7bc(sp14, &spB8, &sp64, data_ov004_02291630.unk0) == -1) {
        func_ov004_021dd590(sp14 + M2C_ERROR(/* Read from unset register $pc */)->unk10C);
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unkE8) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    func_ov004_021dbe5c(sp20, 0, M2C_ERROR(/* Read from unset register $pc */)->unkE8);
    func_ov004_021dbc80(&sp4C);
    func_ov004_021dbc78(data_ov004_02291630.unk0, &sp4C);
    sp54 = sp24;
    sp58 = spC;
    if (func_ov004_021dbdf4(data_ov004_0220a294 + 1, &sp4C, 0, 0, &sp54) <= 0) {
        temp_r2 = sp3C + 1;
        sp3C = temp_r2;
        if (temp_r2 > (s32) sp30.unk4) {
            if (sp14 == 0) {
                func_ov004_021dd590(0xF);
            } else if (sp14 == 1) {
                func_ov004_021dd590(0x10);
            } else {
                func_ov004_021dd590(0x11);
            }
            var_r4_3 = -1;
            goto block_153;
        }
        func_ov004_021de280(sp30.unk6);
        goto loop_47;
    }
    sp48 = 8;
    temp_r2_2 = func_ov004_021dbe40(data_ov004_0220a294, sp20 + 0xC, M2C_ERROR(/* Read from unset register $pc */)->unk64, 0, &sp40, &sp48);
    sp20->unk0 = (? *) data_ov004_02291630.unk0;
    sp20->unk4 = func_ov004_021dbd1c(temp_r2_2);
    temp_r0_14 = func_ov004_021dd150(sp14, sp20, &sp3C, &sp64, data_ov004_02291630.unk0);
    sp18 = temp_r0_14;
    if (temp_r0_14 == 0x64) {
        var_r4_3 = 0;
        goto block_153;
    }
    if (temp_r0_14 == -1) {
        var_r4_3 = -1;
        goto block_153;
    }
    if (sp14 == temp_r0_14) {
        sp14 = temp_r0_14;
        if (sp3C > (s32) sp30.unk4) {
            if (sp18 == 0) {
                func_ov004_021dd590(0xF);
            } else if (sp18 == 1) {
                func_ov004_021dd590(0x10);
            } else {
                func_ov004_021dd590(0x11);
            }
            var_r4_3 = -1;
block_153:
            if (data_ov004_0220a294 != -1) {
                func_ov004_021dbdbc();
            }
            data_ov004_0220a294 = -1;
            if (func_ov004_021dbea0() != 0) {
                *(sp8 + &data_ov004_0220a294) = 0xF;
                func_ov004_021dd5f0();
                return -1;
            }
            if (var_r4_3 != 0) {
                temp_r0 = func_ov004_021dd584() - 0xF;
                if (temp_r0 <= 6U) {
                    return ((s16) ((temp_r0 * 2) + M2C_ERROR(/* Read from unset register $pc */))->unk8 + M2C_ERROR(/* Read from unset register $pc */))();
                }
                *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk44) = 0xF;
                func_ov004_021dd5f0();
                return -1;
            }
            if (func_ov004_021dd374(sp8) != 0) {
                *(sp8 + &data_ov004_0220a294) = 6;
                func_ov004_021dd5f0();
                return -1;
            }
            return 0;
        }
        func_ov004_021de280(sp30.unk6);
        goto loop_46;
    }
    if (temp_r0_14 != 2) {
        goto block_144;
    }
    if (data_ov004_0220a294 != -1) {
        func_ov004_021dbdbc();
    }
    data_ov004_0220a294 = sp28;
    if (func_ov004_021dbea0() != 0) {
        *(sp8 + &data_ov004_0220a294) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    var_r4_4 = 0;
    func_ov004_021dd20c(4);
loop_115:
    if (data_ov004_02291608 != NULL) {
        func_ov004_021de23c();
        data_ov004_02291608 = NULL;
    }
    if (func_ov004_021de46c(&data_ov004_02291608) == -1) {
        *(sp8 + &data_ov004_0220a294) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    temp_r0_15 = func_ov004_021dd2c8(data_ov004_02291608);
    if (temp_r0_15 == 4) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk2C4) = 2;
        func_ov004_021dd5f0();
        return -1;
    }
    if (temp_r0_15 != 0) {
        if (var_r4_4 >= (s32) (s16) sp30.unk0) {
            *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk2A0) = 1;
            func_ov004_021dd5f0();
            return -1;
        }
        func_ov004_021de280(temp_r7);
        var_r4_4 = (s32) (s16) (var_r4_4 + 1);
        goto loop_115;
    }
    temp_r0_16 = func_ov004_021de250(0x58);
    *M2C_ERROR(/* Read from unset register $pc */)->unk278 = temp_r0_16;
    if (temp_r0_16 == NULL) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk26C) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    func_ov004_021dbe5c(temp_r0_16, 0, 0x58);
    var_r4_2 = 0;
    if ((s32) (s16) sp30.unk0 > 0) {
loop_128:
        temp_r0_17 = func_ov004_021de288(&sp7C, *M2C_ERROR(/* Read from unset register $pc */)->unk244);
        if (temp_r0_17 == -1) {
            *(sp8 + &data_ov004_0220a294) = 0xF;
            func_ov004_021dd5f0();
            return -1;
        }
        if (((temp_r0_17 == 0) && ((temp_r0_17 != 0) || (*data_ov004_02291610.unk0 == (? *)1))) || (func_ov004_021de280(temp_r7), var_r4_2 += 1, ((s32) var_r4_2 >= (s32) (s16) sp30.unk0))) {
            goto block_134;
        }
        goto loop_128;
    }
block_134:
    if (var_r4_2 == (s16) sp30.unk0) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk1EC) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    if (func_ov004_021dbecc(sp1C, data_ov004_02291630.unk14, sp1C) != 0) {
        func_ov004_021dd590(0xC);
        *(sp8 + &data_ov004_0220a294) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    func_ov004_021dd5f0();
    temp_r0_18 = func_ov004_021dbdd0(2, 2, 0);
    *M2C_ERROR(/* Read from unset register $pc */)->unk194 = temp_r0_18;
    if (temp_r0_18 < 0) {
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk190) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    if (func_ov004_021dbdd8(temp_r0_18, &data_ov004_02291630, 1, &sp38, 4) < 0) {
        func_ov004_021dd590(0xB);
        *(sp8 + M2C_ERROR(/* Read from unset register $pc */)->unk160) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
    func_ov004_021dbe5c(&sp5C, 0, 8);
    sp5C.unk1 = 2;
    sp60 = func_ov004_021dbd84(sp1C);
    sp30.unk2E = func_ov004_021dbd6c(M2C_ERROR(/* Read from unset register $pc */)->unk140);
    if (func_ov004_021dbdc4(data_ov004_0220a294, &sp5C, 8) < 0) {
        *(sp8 + &data_ov004_0220a294) = 0xF;
        func_ov004_021dd5f0();
        return -1;
    }
block_144:
    sp14 = sp18;
    goto loop_46;
}
```

```c
// func_01ff8180.c — DIFFERS from old pin (drops one spurious unreferenced extern)
extern ? OSi_IrqCallbackTable;

void func_01ff8180(void) {
    s32 temp_r0;
    s32 var_r1;

    if ((void *)0x04000210->unk-8 == 0) {
        return;
    }
    var_r1 = (void *)0x04000210->unk0 & (void *)0x04000210->unk4;
    if (var_r1 == 0) {
        return;
    }
    do {
        temp_r0 = CLZ(var_r1);
        var_r1 &= ~(-0x80000000U >> temp_r0);
    } while (var_r1 != 0);
    (void *)0x04000210->unk4 = (u32) (-0x80000000U >> temp_r0);
    *(&OSi_IrqCallbackTable + ((0x1F - temp_r0) * 4))();
}
```

```c
// func_01ff8624.c — identical to old pin
? func_01ff8334();                                  /* extern */
? func_01ff8544();                                  /* extern */
extern u16 data_021a66f4;

void func_01ff8624(void) {
    do {

    } while (data_021a66f4 == 0);
    *(s16 *)0x04000208 = 0;
    func_01ff8544();
    func_01ff8334();
}
```

```c
// func_ov001_021c9d60.c — identical to old pin
? Fill32(?, ? *, ?);                                /* extern */
? func_0200592c();                                  /* extern */
? func_02005bfc(?);                                 /* extern */
? func_0208c884(?, ?);                              /* extern */
? func_0208c8b0(?);                                 /* extern */
? func_0208c8cc(?, ?, ?);                           /* extern */
? func_0208cc90();                                  /* extern */
? func_0208d0bc(?);                                 /* extern */
? func_0208d138(?);                                 /* extern */
? func_0208d1e4(?);                                 /* extern */
? func_0208d8c0(?);                                 /* extern */
? func_0208da2c(?);                                 /* extern */
? func_02094504(?, ?, ?);                           /* extern */
? func_ov000_021ab21c();                            /* extern */
? func_ov000_021ab520(?, ?);                        /* extern */
? func_ov000_021ab5ac(?, ?);                        /* extern */
? func_ov000_021ab8f8();                            /* extern */
extern ? data_ov001_021ca420;

s32 func_ov001_021c9d60(void) {
    Fill32(0, &data_ov001_021ca420, 4);
    *(u16 *)0x04000304 &= ~0x8000;
    func_0200592c();
    func_0208d1e4(0x1FF);
    func_02094504(0, 0x06800000, 0xA4000);
    func_0208cc90();
    func_02094504(0xC0, 0x07000000, 0x400);
    func_02094504(0xC0, 0x07000400, 0x400);
    func_02094504(0, 0x05000000, 0x400);
    func_02094504(0, 0x05000400, 0x400);
    func_ov000_021ab21c();
    (void *)0x04000000->unk0 = (s32) ((void *)0x04000000->unk0 & ~0x1F00);
    (void *)0x04000000->unk1000 = (s32) ((void *)0x04000000->unk1000 & ~0x1F00);
    func_ov000_021ab520(0, 1);
    func_ov000_021ab520(1, 1);
    func_ov000_021ab5ac(0, -0x10);
    func_ov000_021ab5ac(1, -0x10);
    func_ov000_021ab8f8();
    func_0208c884(0x0400006C, 0);
    func_0208c884(0x0400106C, 0);
    func_0208da2c(1);
    func_0208d8c0(2);
    func_0208c8cc(1, 0, 0);
    (u16 *)0x04000000->unk0 = (s32) ((u16 *)0x04000000->unk0 & ~0x07000000);
    (u16 *)0x04000000->unk0 = (s32) ((u16 *)0x04000000->unk0 & ~0x38000000);
    *(u16 *)0x04000060 &= 0xFFFFCFFD;
    *(u16 *)0x04000060 = (*(u16 *)0x04000060 & ~0x3000) | 0x10;
    *(u16 *)0x04000060 &= 0xCFFB;
    *(u16 *)0x04000060 = (*(u16 *)0x04000060 & ~0x3000) | 8;
    func_0208d138(4);
    func_0208d0bc(8);
    func_0208c8b0(0);
    func_02005bfc(1);
    func_02005bfc(2);
    return 1;
}
```

```c
// func_ov014_021b2280.c — DIFFERS from old pin (same stack-arg-by-ref fix as 021dc474)
? func_0200197c(?, ? *, ?);                         /* extern */
? func_02001bc8(? *, ?, ?);                         /* extern */
? func_02001d68(u32);                               /* extern */
? func_0200592c();                                  /* extern */
? func_02005bfc(?);                                 /* extern */
? func_02005ee0();                                  /* extern */
? func_0201d5c0(?, ?);                              /* extern */
? func_0202adf8(? *);                               /* extern */
? func_0202ae1c(u32);                               /* extern */
? func_0202c070(u32);                               /* extern */
? func_0208c884(?, ?);                              /* extern */
? func_0208c8b0(?);                                 /* extern */
? func_0208c8cc(?, ?, ?);                           /* extern */
? func_0208c940();                                  /* extern */
? func_0208cc90();                                  /* extern */
? func_0208cfa4(?);                                 /* extern */
? func_0208d0bc(?);                                 /* extern */
? func_0208d138(?);                                 /* extern */
? func_0208d1e4(?);                                 /* extern */
? func_0208d6f4(?);                                 /* extern */
? func_0208d7ac(?);                                 /* extern */
? func_0208d8c0(?);                                 /* extern */
? func_0208da2c(?);                                 /* extern */
? func_02094504(?, ?, ?);                           /* extern */
? func_02094550(? *, ?, ?);                         /* extern */
? func_ov014_021b274c(? *);                         /* extern */
? func_ov014_021b3c20(? *);                         /* extern */
extern ? data_02104f4c;
extern ? data_ov014_021b5040;
extern ? data_ov014_021b5048;
extern ? data_ov014_021b5088;
extern ? data_ov014_02235094;
extern ? data_ov014_022350f4;

s32 func_ov014_021b2280(void) {
    ? sp0;

    func_02094504(0xC0, 0x07000000, 0x400);
    func_02094504(0xC0, 0x07000400, 0x400);
    func_02094504(0, 0x05000000, 0x400);
    func_02094504(0, 0x05000400, 0x400);
    func_0200592c();
    func_0208d1e4(0x1FF);
    func_02094504(0, 0x06800000, 0xA4000);
    func_0208cc90();
    *(u16 *)0x04000304 |= 0x8000;
    func_0208c8cc(1, 0, 0);
    func_0208da2c(6);
    func_0208d7ac(0x10);
    func_0208d8c0(1);
    func_0208d6f4(0x20);
    *(s32 *)0x04000000 = (*(s32 *)0x04000000 & 0xFFCFFFEF) | 0x200010;
    func_0201d5c0(4, 2);
    *(u16 *)0x0400000E = (*(u16 *)0x0400000E & 0x43) | 0xF80;
    *(u16 *)0x0400000E = (*(u16 *)0x0400000E & ~3) | 3;
    func_0208c8b0(0);
    func_0208d138(0x80);
    func_0208d0bc(8);
    func_0208cfa4(0x100);
    *(s32 *)0x04001000 = (*(s32 *)0x04001000 & 0xFFCFFFEF) | 0x200010;
    func_0201d5c0(9, 2);
    *(u16 *)0x0400100E = (*(u16 *)0x0400100E & 0x43) | 0xF00;
    *(u16 *)0x0400100E = (*(u16 *)0x0400100E & ~3) | 3;
    *(u16 *)0x0400100C = (*(u16 *)0x0400100C & 0x43) | 0xE00;
    *(u16 *)0x0400100C = (*(u16 *)0x0400100C & ~3) | 2;
    *(u16 *)0x0400100A = (*(u16 *)0x0400100A & 0x43) | 0x8D00;
    *(u16 *)0x0400100A = (*(u16 *)0x0400100A & ~3) | 1;
    *(u16 *)0x04001008 = (*(u16 *)0x04001008 & 0x43) | 0x8B00;
    *(u16 *)0x04001008 &= ~3;
    *(void *)0x04000000 = (s32) (*(void *)0x04000000 & ~0x1F00);
    func_0208c940();
    *(void *)0x04001000 = (s32) (*(void *)0x04001000 & ~0x1F00);
    *(void *)0x04001000 = (s32) (*(void *)0x04001000 | 0x10000);
    func_02005bfc(3);
    func_02005ee0();
    data_ov014_021b5040.unk44 = 0;
    if (data_ov014_021b5040.unk0 == 0) {
        func_0202adf8(&data_ov014_021b5048);
        func_0202ae1c((u32) (data_02104f4c.unk4 << 0x1D) >> 0x1D);
        func_0202c070((u32) (data_02104f4c.unk4 << 0x1D) >> 0x1D);
        data_ov014_021b5040.unk44 = 1;
    }
    func_0200197c(4, &data_ov014_021b5088, 0x80000);
    func_02001d68((u32) (data_02104f4c.unk4 << 0x1D) >> 0x1D);
    func_02001bc8(&sp0, 0x7FFF, 0x810);
    func_02094550(&sp0, 0x05000400, 0x20);
    func_0208c884(0x0400006C, -0x10);
    func_0208c884(0x0400106C, -0x10);
    if (data_ov014_021b5040.unk44 == 0) {
        func_ov014_021b3c20(&data_ov014_022350f4);
    }
    func_ov014_021b274c(&data_ov014_02235094);
    data_ov014_021b5040.unk0 = 0;
    return 1;
}
```

```c
// func_ov004_021dcbcc.c — identical to old pin
s32 func_ov004_021dcbcc(s32 arg0, s32 arg1) {
    s32 var_r4;
    s32 var_r5;
    u8 *var_r3;
    u8 temp_r0;

    var_r5 = 0;
    var_r3 = arg0 + (arg1 - 1);
    var_r4 = 0;
    if (arg1 > 0) {
        do {
            temp_r0 = *var_r3;
            var_r3 -= 1;
            var_r5 = (var_r5 << 8) + temp_r0;
            var_r4 += 1;
        } while (var_r4 < arg1);
    }
    return var_r5;
}
```

### Part 1 verdict: DONE

`M2C_COMMIT` is `19f2ddb22dcf5161c27b7eae62f142e697ae895f`. No other file in the pin/tooling
path was touched.

## Canary before Part 2

Required before spending a 3-region gate on Part 2. One m2c_feed draft at the newly-adopted
pin — reusing `func_ov004_021dc474` from the panel above (vendor confirmed at
`19f2ddb` via `git -C tools/_vendor/m2c rev-parse --short HEAD`); draft is the same one shown
above and produced cleanly. The m2c pipeline is not broken by the bump — proceeded to check
Part 2's contention gate.

## Part 2 — dsd leg: BLOCKED again (contention), not attempted

⚠️ **Unlike last round, this time the instruction was "wait and re-check," not an immediate
stop, so an actual bounded wait was run — not just a single instantaneous check.**

**First check**, immediately after the canary:

```
$ pgrep -fl 'mwcc|mwld|mwasm|ninja'
3902 ninja sha1
4047 /bin/zsh -c ... cd /Users/leo/Dev/spirit-caller/claude-decomper-batch4 && ninja sha1 ...
4049 ninja sha1
4178 /bin/zsh -c ... ninja sha1 ...
4180 ninja sha1
```

**Bounded poll**: 10 checks at 55s apart (~9 minutes total, run in the background so other
round work — Part 1's writeup — continued in parallel rather than blocking on it). Result:
**still busy** — same `ninja sha1` PIDs (3902/4049/4180) present at every check, and by the
final check a *second* worktree (`claude-decomper-batch3`) had also started live `mwccarm.exe`
compiles:

```
STILL BUSY after 10 checks (~9 min) — giving up the wait window
3902 ninja sha1
4047 /bin/zsh -c ... cd /Users/leo/Dev/spirit-caller/claude-decomper-batch4 && ninja sha1 ...
4049 ninja sha1
4178 /bin/zsh -c ... ninja sha1 ...
4180 ninja sha1
```

Final re-confirmation immediately after (same command, fresh output) additionally showed:

```
10002 ninja sha1
77788 /bin/sh -c WINEPREFIX=".../claude-decomper-batch3/.wine-lane" wine ".../mwccarm.exe" ... -c src/overlay021/func_ov021_021abcac.c -o build/eur/src/overlay021 ...
77789 start.exe /exec .../mwccarm.exe ... -c src/overlay021/func_ov021_021abcac.c -o
77790 /bin/sh -c WINEPREFIX=".../claude-decomper-batch3/.wine-lane" wine ".../mwccarm.exe" ... -c src/overlay021/data_ov021_021ac874.c -o build/eur/src/overlay021 ...
77791 start.exe /exec .../mwccarm.exe ... -c src/overlay021/data_ov021_021ac874.c -o
```

Three to four concurrent `ninja sha1` invocations plus live `mwccarm.exe` compiles across two
Decomper worktrees (`batch3`, `batch4`) — contention is not clearing, it is escalating. Per
this item's own instruction ("if you again cannot get a clean window, deliver Part 1 and report
Part 2 blocked... a reported blocked leg beats a rushed or contended gate"), **Part 2 was not
attempted**. No dedicated worktree was created, `DSD_VERSION` in `tools/configure.py` was never
touched, no gate was run.

**Consequence for the two carry-forward items:**

- **dsd v0.11.0 `dis` panic**: still open, still untested against v0.12.0 — Part 2 never
  reached the point of installing the new dsd, so whether v0.12.0 fixes it remains unknown.
  Reproduction was already flagged as a background task after #1512 (title: "Report dsd v0.11.0
  `dis` panic to ds-decomp"); not re-flagged here to avoid a duplicate.
- **m2c `MagicFuncPattern` assert** on `bl symbol+offset` targets (post-link objects only,
  identical on both pins): unaffected by this round either way — carried forward here per the
  brief's instruction, full detail already on record in `docs/research/q-toolchain-repin-eval.md`
  (§ Incidental findings). Restating the one-line version so it's visible from the doc that
  actually changed the pin: feeding m2c a post-link compiled object (rather than a pre-link gap
  object) can produce a `bl symbol+offset` branch target that crashes `MagicFuncPattern`'s
  `assert isinstance(ins.args[0], AsmGlobalSymbol)` — not encountered in normal `m2c_feed.py`
  gap-object usage, only relevant if someone tries to feed m2c an already-matched function's
  object directly.

This item remains open for the dsd leg. Retry when the shared wine lane is free.

## `git diff --stat` (this PR)

```
 docs/queue/claude-scaffolder.md       |   2 +-
 docs/research/README.md               |   1 +
 docs/research/cm-toolchain-adopt-1.md | 983 +++++++++++++++++++++++++++++++
 tools/m2c_bootstrap.py                |   7 +-
 4 files changed, 990 insertions(+), 3 deletions(-)
```

`tools/m2c_bootstrap.py` is the only pin file touched, and it's the one this item asked for.
`tools/configure.py` (dsd's pin) and `tools/permute.py` (permuter's pin) do not appear — Part 2
was not attempted, so neither was touched.

## `python3.13 -m pytest -q tests`

```
3271 passed, 3 skipped, 72 subtests passed in 685.31s (0:11:25)
```

Green. (One integration test, `test_cmatch_loop.py`, briefly mutates a real matched function's
source + its `delinks.txt` registration mid-run as part of exercising the real drafting
pipeline against a live target, and restores both in teardown — confirmed by re-checking
`git status` before and after the full run; not a concern, just worth noting for whoever next
sees a surprising diff appear and disappear while this suite is running.)
