; func_0201f820 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191e60
        .extern data_02191ee0
        .extern data_02191f40
        .extern func_0201f148
        .extern func_0201f900
        .extern func_02093b08
        .extern func_0209e214
        .extern func_0209e404
        .extern func_0209ebd4
        .global func_0201f820
        .arm
func_0201f820:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x2
    beq .L_1c
    bl func_02093b08
    movs r0, #0x0
.L_1c:
    bl func_0209e404
    cmp r0, #0x8000
    bne .L_38
    mov r0, #0x3
    bl func_0201f148
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_38:
    cmp r0, #0x0
    bne .L_50
    mov r0, #0x16
    bl func_0201f148
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_50:
    ldr r1, _LIT0
    ldrh r2, [r1, #0x2]
    cmp r2, #0x0
    bne .L_94
    mov ip, #0x1
    mov r3, ip
.L_68:
    ldrh r2, [r1, #0x84]
    add r2, r2, #0x1
    strh r2, [r1, #0x84]
    ldrh r2, [r1, #0x84]
    cmp r2, #0x10
    strhih ip, [r1, #0x84]
    ldrh r2, [r1, #0x84]
    sub r2, r2, #0x1
    tst r0, r3, lsl r2
    bne .L_98
    b .L_68
.L_94:
    strh r2, [r1, #0x84]
.L_98:
    bl func_0209e214
    ldr r2, _LIT0
    ldr r3, _LIT1
    strh r0, [r2, #0x86]
    ldr r0, _LIT2
    ldr r1, _LIT3
    str r3, [r2, #0x80]
    bl func_0209ebd4
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f148
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_02191f40
_LIT2: .word func_0201f900
_LIT3: .word data_02191ee0
