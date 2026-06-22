; func_ov002_022119bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd420
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021de64c
        .extern func_ov002_021df130
        .global func_ov002_022119bc
        .arm
func_ov002_022119bc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r7, _LIT0
    ldr r8, _LIT1
    ldr fp, _LIT2
    ldr r6, _LIT3
    mov sl, r0
    mov r9, #0x0
    mov r4, #0x14
    mov r5, #0x38
.L_24:
    ldr r0, [r6, #0xcec]
    eor r0, r0, r9
    mla r3, r0, r5, r8
    ldr r0, [r3, #0x2c]
    cmp r0, #0x0
    beq .L_50
    mov r0, sl
    mov r1, r9
    mov r2, #0x0
    bl func_ov002_021df130
    b .L_94
.L_50:
    ldmia r3, {r1, r2}
    and r0, r1, #0x1
    mla ip, r0, fp, r7
    add r0, ip, #0x30
    mul ip, r2, r4
    ldr ip, [r0, ip]
    ldr r3, [r3, #0xc]
    mov r0, ip, lsl #0x12
    mov ip, ip, lsl #0x2
    mov ip, ip, lsr #0x18
    mov ip, ip, lsl #0x1
    add r0, ip, r0, lsr #0x1f
    cmp r3, r0
    bne .L_94
    mov r0, sl
    mov r3, #0x0
    bl func_ov002_021de64c
.L_94:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_24
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word data_ov002_022cd420
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d016c
