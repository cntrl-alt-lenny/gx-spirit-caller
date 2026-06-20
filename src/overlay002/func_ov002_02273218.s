; func_ov002_02273218 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021de5d4
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02270ca8
        .extern func_ov002_02290500
        .global func_ov002_02273218
        .arm
func_ov002_02273218:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    movs r1, r1, lsr #0x18
    beq .L_e30
    cmp r1, #0x1
    beq .L_e9c
    cmp r1, #0x2
    beq .L_ef4
    b .L_efc
.L_e30:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_e60
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_02290500
    b .L_e70
.L_e60:
    mov r1, #0x7e
    bl func_ov002_021ae400
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_e70:
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, pc}
.L_e9c:
    bl func_ov002_022593f4
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT4
    mov r2, #0x0
    ldr r3, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    add r1, r3, r1
    bl func_ov002_021de5d4
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, pc}
.L_ef4:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_efc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_02270ca8
_LIT3: .word data_ov002_022cd318
_LIT4: .word data_ov002_022d016c
