; func_ov002_022a9cac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov002_022cd73c
        .extern func_ov002_0229d5c0
        .extern func_ov002_0229e27c
        .extern func_ov002_0229e85c
        .global func_ov002_022a9cac
        .arm
func_ov002_022a9cac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    add r5, sl, #0x3e0
    mov r4, #0x0
.L_10:
    mov r0, r5
    bl func_ov002_0229e27c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r5, r5, #0xcc
    blt .L_10
    mov r8, #0x0
    ldr r5, _LIT0
    add r6, sl, #0x280
    mov fp, r8
    mov r4, #0xb0
.L_3c:
    ldr r0, [r5, #0x4]
    mov r7, fp
    eor r0, r0, r8
    mla r9, r0, r4, r6
.L_4c:
    mov r0, r9
    bl func_ov002_0229e85c
    add r7, r7, #0x1
    cmp r7, #0x4
    add r9, r9, #0x2c
    blt .L_4c
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_3c
    mov r8, #0x0
    ldr r4, _LIT1
    add r6, sl, #0x1b8
    mov r5, r8
    mov fp, r8
.L_84:
    ldr r0, [r4, #0x38]
    tst r0, #0x8
    beq .L_b0
    mov r9, r5
    mov r7, r6
.L_98:
    mov r0, r7
    bl func_ov002_0229d5c0
    add r9, r9, #0x1
    cmp r9, #0x5
    add r7, r7, #0x14
    blt .L_98
.L_b0:
    mov r9, fp
    mov r7, sl
.L_b8:
    mov r0, r7
    bl func_ov002_0229d5c0
    add r9, r9, #0x1
    cmp r9, #0xa
    add r7, r7, #0x14
    ble .L_b8
    add r8, r8, #0x1
    cmp r8, #0x2
    add r6, r6, #0x64
    add sl, sl, #0xdc
    blt .L_84
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_021040ac
