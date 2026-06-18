; func_ov002_021f13ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021efa38
        .extern func_ov002_021efe44
        .global func_ov002_021f13ec
        .arm
func_ov002_021f13ec:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldrh r3, [r7, #0xa]
    mov r6, r1
    mov r5, r2
    cmp r3, #0x0
    beq .L_494
    bl func_ov002_021efe44
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_494:
    bl func_ov002_021efa38
    cmp r0, #0x0
    beq .L_4d4
    mov r4, #0x0
.L_4a4:
    cmp r5, r4
    beq .L_4c8
    mov r0, r7
    mov r1, r6
    mov r2, r4
    bl func_ov002_021efe44
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_4c8:
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_4a4
.L_4d4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
