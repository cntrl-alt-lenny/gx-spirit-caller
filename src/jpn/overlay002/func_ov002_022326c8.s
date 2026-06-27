; func_ov002_022326c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c83ac
        .extern func_ov002_021de318
        .extern func_ov002_021df728
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0225761c
        .global func_ov002_022326c8
        .arm
func_ov002_022326c8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, r0
    mov r8, #0x0
    bl func_ov002_021e2a4c
    mov r0, fp
    bl func_ov002_0225761c
    mov r1, r0
    mov r0, fp
    bl func_ov002_021de318
    mov r6, r8
    mov r9, r0
    mov sl, r6
    mov r4, #0x1
    mov r5, r8
.L_7ec:
    mov r7, r5
.L_7f0:
    add r0, r7, sl
    tst r9, r4, lsl r0
    beq .L_80c
    mov r0, r6
    mov r1, r7
    bl func_ov002_021c83ac
    add r8, r8, r0
.L_80c:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_7f0
    add r6, r6, #0x1
    cmp r6, #0x2
    add sl, sl, #0x10
    blt .L_7ec
    ldrh r1, [fp, #0x2]
    mov r0, fp
    mov r2, r8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df728
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
