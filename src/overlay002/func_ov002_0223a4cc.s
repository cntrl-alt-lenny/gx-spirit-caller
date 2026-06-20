; func_ov002_0223a4cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021b9e00
        .extern func_ov002_021b9e48
        .extern func_ov002_021b9e90
        .extern func_ov002_021b9ea4
        .extern func_ov002_021b9eb8
        .extern func_ov002_021d91e0
        .extern func_ov002_021d93e0
        .extern func_ov002_021d94ac
        .extern func_ov002_0225764c
        .global func_ov002_0223a4cc
        .arm
func_ov002_0223a4cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r6, _LIT0
    mov r9, #0x0
    ldr r5, _LIT1
    mov sl, r0
    sub r4, r6, #0xda
    mov fp, r9
.L_138:
    ldr r0, _LIT2
    mov r8, fp
    ldr r0, [r0, #0xcec]
    eor r7, r0, r9
.L_148:
    mov r0, sl
    mov r1, r7
    mov r2, r8
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_220
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9e00
    movs r2, r0
    beq .L_184
    mov r0, r7
    mov r1, r8
    rsb r2, r2, #0x0
    bl func_ov002_021d91e0
.L_184:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9e48
    movs r2, r0
    beq .L_1a8
    mov r0, r7
    mov r1, r8
    rsb r2, r2, #0x0
    bl func_ov002_021d93e0
.L_1a8:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9e90
    movs r2, r0
    beq .L_1d0
    mov r0, r7
    mov r1, r8
    mov r3, r6
    rsb r2, r2, #0x0
    bl func_ov002_021d94ac
.L_1d0:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9ea4
    movs r2, r0
    beq .L_1f8
    mov r0, r7
    mov r1, r8
    mov r3, r5
    rsb r2, r2, #0x0
    bl func_ov002_021d94ac
.L_1f8:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9eb8
    movs r2, r0
    beq .L_220
    mov r0, r7
    mov r1, r8
    mov r3, r4
    rsb r2, r2, #0x0
    bl func_ov002_021d94ac
.L_220:
    add r8, r8, #0x1
    cmp r8, #0xa
    ble .L_148
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_138
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001513
_LIT1: .word 0x00001a90
_LIT2: .word data_ov002_022d016c
