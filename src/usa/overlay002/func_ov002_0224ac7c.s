; func_ov002_0224ac7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce640
        .extern data_ov002_022cf08c
        .extern func_0202e1e0
        .extern func_ov002_021ca360
        .extern func_ov002_02253370
        .global func_ov002_0224ac7c
        .arm
func_ov002_0224ac7c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r3, r6, #0x1
    mla r0, r3, r0, r1
    mov r5, r2
    add r4, r0, #0x120
    ldr r0, [r4, r5, lsl #0x2]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202e1e0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r7
    bl func_ov002_021ca360
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr ip, _LIT2
    ldr r1, _LIT3
    ldr r2, [ip, #0x494]
    mov r0, #0x0
    mov r3, r2, lsl #0x19
    mov r3, r3, lsr #0x18
    ldrh r1, [r1, r3]
    cmp r1, #0x0
    ble .L_1ac
    ldr r4, [r4, r5, lsl #0x2]
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r4, r3, r4, lsr #0x1f
.L_184:
    add r0, r0, #0x1
    add r3, r2, r0
    mov r3, r3, lsl #0x19
    add r3, ip, r3, lsr #0x18
    add r3, r3, #0x400
    ldrh r3, [r3, #0x98]
    cmp r3, r4
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r0, r1
    blt .L_184
.L_1ac:
    mov r0, r6
    mov r2, r5
    mov r1, #0xb
    bl func_ov002_02253370
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022ce1a8
_LIT3: .word data_ov002_022ce640
