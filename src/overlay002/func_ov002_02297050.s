; func_ov002_02297050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b878
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021feb08
        .global func_ov002_02297050
        .arm
func_ov002_02297050:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_68
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_e8
    ldr r0, _LIT1
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_e8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_68:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x17
    ldrh r0, [r4, #0x2]
    bne .L_c8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT2
    mvn r2, #0x0
    rsb r0, r0, #0x1
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_e8
    ldr r0, _LIT3
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_e8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_c8:
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT4
    mvn r2, #0x0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_e8:
    mov r0, r4
    bl func_ov002_021feb08
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000017d4
_LIT1: .word 0x0000171d
_LIT2: .word 0x000017c6
_LIT3: .word 0x0000184f
_LIT4: .word 0x00001771
