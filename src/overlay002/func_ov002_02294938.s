; func_ov002_02294938 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bae7c
        .extern func_ov002_021bc618
        .extern func_ov002_022536e8
        .extern func_ov002_02259f74
        .global func_ov002_02294938
        .arm
func_ov002_02294938:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    ldrh r1, [r6, #0x2]
    mov r5, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    ldrh r1, [r6, #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259f74
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_2a0
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT1
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_2a0:
    cmp r5, r4
    movge r5, r4
    cmp r5, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000017a3
_LIT1: .word 0x00001398
