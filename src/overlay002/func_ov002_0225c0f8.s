; func_ov002_0225c0f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb264
        .extern func_ov002_021c1ad0
        .extern func_ov002_021df680
        .extern func_ov002_021df780
        .extern func_ov002_021e13f4
        .global func_ov002_0225c0f8
        .arm
func_ov002_0225c0f8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r6, r0
    ldr r1, [r2, #0x1c]
    ldr r4, [r2, #0x4]
    bl func_ov002_021c1ad0
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x10]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    and r0, r5, #0x2
    mov r2, #0x1
    str r2, [r1, #0x10]
    cmp r0, #0x0
    bgt .L_428
    ldr r1, _LIT1
    mov r0, r4
    sub r2, r2, #0x2
    bl func_ov002_021bae7c
    mov r7, r0
    cmp r7, #0x0
    ble .L_428
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_021df680
    mov r0, r6
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021e13f4
.L_428:
    ldr r0, _LIT2
    mov r1, r6
    mov r2, r5
    bl func_ov002_021bb264
    mov r7, r0
    cmp r7, #0x0
    ble .L_478
    ldr r1, _LIT2
    mvn r0, #0x0
    bl func_ov002_021df680
    cmp r7, #0x0
    mov r5, #0x0
    ble .L_478
    mov r4, #0x1f4
.L_460:
    mov r0, r6
    mov r1, r4
    bl func_ov002_021df780
    add r5, r5, #0x1
    cmp r5, r7
    blt .L_460
.L_478:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x0000131d
_LIT2: .word 0x00001320
