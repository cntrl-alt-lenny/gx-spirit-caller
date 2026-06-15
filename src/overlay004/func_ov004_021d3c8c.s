; func_ov004_021d3c8c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02105b70
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_02007230
        .extern func_02008888
        .extern func_0202c0c0
        .extern func_0203268c
        .extern func_02032e8c
        .extern func_02032efc
        .extern func_0203309c
        .extern func_ov004_021d8798
        .extern func_ov004_021d8cd0
        .global func_ov004_021d3c8c
        .arm
func_ov004_021d3c8c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r4, _LIT2
    bl func_0203309c
    cmp r0, #0x1
    bne .L_50
    mov r0, #0xe8
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT3
    mov r2, #0x1
    bl func_ov004_021d8798
    bl func_02008888
    bl func_02007230
    cmp r0, #0x0
    mvnne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    bl func_ov004_021d8cd0
.L_50:
    bl func_0203268c
    ldr r1, _LIT0
    bl func_02032e8c
    add r0, r4, #0x128
    add r5, r0, #0x3c00
    mov r4, #0x0
.L_68:
    bl func_0203268c
    mov r1, r4
    mov r2, r5
    bl func_02032efc
    add r4, r4, #0x1
    cmp r4, #0x3c
    add r5, r5, #0x54
    blt .L_68
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02105b70
_LIT1: .word 0x4159584a
_LIT2: .word data_ov004_0220b500
_LIT3: .word data_ov004_022915e8
