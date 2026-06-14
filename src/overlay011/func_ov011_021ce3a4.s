; func_ov011_021ce3a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .extern func_020139b4
        .extern func_ov011_021cad00
        .extern func_ov011_021ccfcc
        .extern func_ov011_021cdb7c
        .extern func_ov011_021ce344
        .extern func_ov011_021ceffc
        .global func_ov011_021ce3a4
        .arm
func_ov011_021ce3a4:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2a0]
    cmp r0, #0x0
    beq .L_84
    cmp r0, #0x1
    beq .L_d4
    b .L_17c
.L_84:
    ldr r1, [r4, #0x268]
    mov r0, r1, lsl #0x17
    movs r2, r0, lsr #0x1c
    beq .L_17c
    ldr r0, [r4, #0x280]
    mov r0, r0, lsl #0x18
    cmp r2, r0, lsr #0x18
    bne .L_17c
    mov r0, r1, lsl #0x13
    cmp r2, r0, lsr #0x1c
    beq .L_b4
    bl func_ov011_021ccfcc
.L_b4:
    mov r0, #0x0
    str r0, [r4, #0x288]
    bl func_ov011_021ce344
    ldr r1, [r4, #0x260]
    mov r0, #0x1
    orr r1, r1, #0x100000
    str r1, [r4, #0x260]
    ldmia sp!, {r4, pc}
.L_d4:
    ldr r0, [r4, #0x240]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x3
    ldreq r0, [r4, #0x238]
    cmpeq r0, #0x0
    ldreq r0, [r4, #0x23c]
    cmpeq r0, #0x0
    bne .L_17c
    ldr r1, [r4, #0x25c]
    ldr r0, [r4, #0x258]
    mov r1, r1, lsl #0x9
    mov r1, r1, lsr #0x18
    mov r0, r0, lsl #0xe
    cmp r1, r0, lsr #0x18
    bne .L_17c
    ldr r1, [r4, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    orr r0, r0, #0xc000
    str r0, [r4, #0x274]
    bl func_ov011_021cdb7c
    cmp r0, #0x0
    bne .L_144
    ldr r0, [r4, #0x258]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x18
    bl func_ov011_021cad00
.L_144:
    bl func_ov011_021cdb7c
    cmp r0, #0x0
    beq .L_158
    bl func_ov011_021ceffc
    bl func_ov011_021ccfcc
.L_158:
    bl func_020139b4
    ldr r1, [r4, #0x260]
    mov r0, r0, lsl #0x1c
    bic r1, r1, #0xf0000
    orr r0, r1, r0, lsr #0xc
    orr r0, r0, #0x100000
    str r0, [r4, #0x260]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_17c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d403c
_LIT2: .word 0xffe01fff
