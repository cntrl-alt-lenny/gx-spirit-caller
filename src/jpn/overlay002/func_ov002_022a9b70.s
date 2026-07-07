; func_ov002_022a9b70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov002_022cd65c
        .extern func_ov002_0229d4b0
        .extern func_ov002_0229e16c
        .extern func_ov002_0229e74c
        .global func_ov002_022a9b70
        .arm
func_ov002_022a9b70:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    add r5, sl, #0x3e0
    mov r4, #0x0
.L_fcc:
    mov r0, r5
    bl func_ov002_0229e16c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r5, r5, #0xcc
    blt .L_fcc
    mov r8, #0x0
    ldr r5, _LIT0
    add r6, sl, #0x280
    mov fp, r8
    mov r4, #0xb0
.L_ff8:
    ldr r0, [r5, #0x4]
    mov r7, fp
    eor r0, r0, r8
    mla r9, r0, r4, r6
.L_1008:
    mov r0, r9
    bl func_ov002_0229e74c
    add r7, r7, #0x1
    cmp r7, #0x4
    add r9, r9, #0x2c
    blt .L_1008
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_ff8
    mov r8, #0x0
    ldr r4, _LIT1
    add r6, sl, #0x1b8
    mov r5, r8
    mov fp, r8
.L_1040:
    ldr r0, [r4, #0x38]
    tst r0, #0x8
    beq .L_106c
    mov r9, r5
    mov r7, r6
.L_1054:
    mov r0, r7
    bl func_ov002_0229d4b0
    add r9, r9, #0x1
    cmp r9, #0x5
    add r7, r7, #0x14
    blt .L_1054
.L_106c:
    mov r9, fp
    mov r7, sl
.L_1074:
    mov r0, r7
    bl func_ov002_0229d4b0
    add r9, r9, #0x1
    cmp r9, #0xa
    add r7, r7, #0x14
    ble .L_1074
    add r8, r8, #0x1
    cmp r8, #0x2
    add r6, r6, #0x64
    add sl, sl, #0xdc
    blt .L_1040
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_02103fcc
