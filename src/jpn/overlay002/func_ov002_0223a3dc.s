; func_ov002_0223a3dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021b9d20
        .extern func_ov002_021b9d68
        .extern func_ov002_021b9db0
        .extern func_ov002_021b9dc4
        .extern func_ov002_021b9dd8
        .extern func_ov002_021d90f0
        .extern func_ov002_021d92f0
        .extern func_ov002_021d93bc
        .extern func_ov002_02257564
        .global func_ov002_0223a3dc
        .arm
func_ov002_0223a3dc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r6, _LIT0
    mov r9, #0x0
    ldr r5, _LIT1
    mov sl, r0
    sub r4, r6, #0xda
    mov fp, r9
.L_1c:
    ldr r0, _LIT2
    mov r8, fp
    ldr r0, [r0, #0xcec]
    eor r7, r0, r9
.L_2c:
    mov r0, sl
    mov r1, r7
    mov r2, r8
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_104
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9d20
    movs r2, r0
    beq .L_68
    mov r0, r7
    mov r1, r8
    rsb r2, r2, #0x0
    bl func_ov002_021d90f0
.L_68:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9d68
    movs r2, r0
    beq .L_8c
    mov r0, r7
    mov r1, r8
    rsb r2, r2, #0x0
    bl func_ov002_021d92f0
.L_8c:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9db0
    movs r2, r0
    beq .L_b4
    mov r0, r7
    mov r1, r8
    mov r3, r6
    rsb r2, r2, #0x0
    bl func_ov002_021d93bc
.L_b4:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9dc4
    movs r2, r0
    beq .L_dc
    mov r0, r7
    mov r1, r8
    mov r3, r5
    rsb r2, r2, #0x0
    bl func_ov002_021d93bc
.L_dc:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9dd8
    movs r2, r0
    beq .L_104
    mov r0, r7
    mov r1, r8
    mov r3, r4
    rsb r2, r2, #0x0
    bl func_ov002_021d93bc
.L_104:
    add r8, r8, #0x1
    cmp r8, #0xa
    ble .L_2c
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_1c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001513
_LIT1: .word 0x00001a90
_LIT2: .word data_ov002_022d008c
