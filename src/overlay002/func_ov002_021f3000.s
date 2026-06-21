; func_ov002_021f3000 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bc55c
        .extern func_ov002_021c1e44
        .extern func_ov002_021c1ef0
        .global func_ov002_021f3000
        .arm
func_ov002_021f3000:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r3, [r6, #0x2]
    mov r5, r1
    mov r4, r2
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    cmp r3, r5
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r4, #0x4
    bge .L_274
    mov r0, r5
    add r1, r4, #0x1
    bl func_ov002_021bc55c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_274:
    cmp r4, #0x0
    ble .L_294
    mov r0, r5
    sub r1, r4, #0x1
    bl func_ov002_021bc55c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_294:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
