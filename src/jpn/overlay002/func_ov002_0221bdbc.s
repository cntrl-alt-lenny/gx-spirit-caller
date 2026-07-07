; func_ov002_0221bdbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_0202e1e0
        .extern func_ov002_021ca360
        .global func_ov002_0221bdbc
        .arm
func_ov002_0221bdbc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r3, [r3, #0x48c]
    mov r4, r2
    ldrh r0, [r3, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    cmpeq r1, #0xb
    bne .L_f0
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, r5, #0x1
    mla r0, r2, r0, r1
    add r1, r0, r4, lsl #0x2
    ldrh r0, [r3, #0x6]
    ldr r1, [r1, #0x120]
    mov r2, #0x0
    mov r1, r1, lsl #0x13
    mov r0, r0, lsl #0x10
    mov r6, r1, lsr #0x13
    movs r0, r0, lsr #0x18
    beq .L_70
    cmp r0, #0x1
    beq .L_a0
    cmp r0, #0x2
    beq .L_b8
    b .L_e4
.L_70:
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_98
    mov r0, r5
    mov r1, r6
    bl func_ov002_021ca360
    cmp r0, #0x0
    movne r2, #0x1
    bne .L_e4
.L_98:
    mov r2, #0x0
    b .L_e4
.L_a0:
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    moveq r2, #0x1
    movne r2, #0x0
    b .L_e4
.L_b8:
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_e0
    ldr r0, _LIT0
    ldr r0, [r0, #0x48c]
    ldrh r0, [r0, #0xa]
    cmp r4, r0
    movne r2, #0x1
    bne .L_e4
.L_e0:
    mov r2, #0x0
.L_e4:
    cmp r2, #0x0
    movne r0, #0x800
    ldmneia sp!, {r4, r5, r6, pc}
.L_f0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
