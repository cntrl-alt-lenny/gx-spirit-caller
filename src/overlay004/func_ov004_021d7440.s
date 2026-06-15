; func_ov004_021d7440 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov004_0220b500
        .extern func_0202c0c0
        .extern func_ov004_021d6f20
        .global func_ov004_021d7440
        .arm
func_ov004_021d7440:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r5, r0
    ldr r4, _LIT0
    bpl .L_d48
    mov r7, #0x0
    mov r6, #0x80
.L_d24:
    add r0, r7, #0x3d4
    bl func_0202c0c0
    mov r1, r0
    mov r0, r7
    mov r2, r6
    bl func_ov004_021d6f20
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_d24
.L_d48:
    cmp r5, #0x0
    blt .L_d54
    bne .L_d78
.L_d54:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xc94]
    add r0, r0, #0xd9
    add r0, r0, #0x300
    bl func_0202c0c0
    mov r1, r0
    mov r0, #0x5
    mov r2, #0x80
    bl func_ov004_021d6f20
.L_d78:
    cmp r5, #0x0
    blt .L_d88
    cmp r5, #0x1
    bne .L_dbc
.L_d88:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xc98]
    cmp r0, #0x0
    movne r0, #0x3
    ldreq r0, _LIT1
    ldreq r0, [r0, #0x34]
    add r0, r0, #0xdb
    add r0, r0, #0x300
    bl func_0202c0c0
    mov r1, r0
    mov r0, #0x6
    mov r2, #0x80
    bl func_ov004_021d6f20
.L_dbc:
    cmp r5, #0x0
    blt .L_dcc
    cmp r5, #0x2
    bne .L_df0
.L_dcc:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xc9c]
    add r0, r0, #0xdf
    add r0, r0, #0x300
    bl func_0202c0c0
    mov r1, r0
    mov r0, #0x7
    mov r2, #0x80
    bl func_ov004_021d6f20
.L_df0:
    cmp r5, #0x0
    blt .L_e00
    cmp r5, #0x3
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_e00:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xca0]
    add r0, r0, #0xe1
    add r0, r0, #0x300
    bl func_0202c0c0
    mov r1, r0
    mov r0, #0x8
    mov r2, #0x80
    bl func_ov004_021d6f20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_021040ac
