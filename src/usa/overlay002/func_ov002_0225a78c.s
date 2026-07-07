; func_ov002_0225a78c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd408
        .extern data_ov002_022cd41c
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0170
        .global func_ov002_0225a78c
        .arm
func_ov002_0225a78c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, [r0]
    ldr r3, _LIT2
    and r1, r1, #0x1
    mla lr, r1, r3, r2
    ldr r1, [r0, #0x1c]
    mov ip, #0x14
    mul r4, r1, ip
    add r1, lr, #0x30
    ldr r4, [r1, r4]
    ldr lr, [r0, #0xec]
    mov r1, r4, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r4, lsr #0x1f
    cmp lr, r1
    bne .L_274
    ldr r1, _LIT3
    mov lr, lr, lsl #0x2
    ldrh lr, [r1, lr]
    ldr r4, [r0, #0xf0]
    mov lr, lr, lsl #0x11
    cmp r4, lr, lsr #0x1e
    beq .L_27c
.L_274:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_27c:
    ldr lr, [r0, #0x8]
    cmp lr, #0x0
    bne .L_2ec
    ldr lr, [r0, #0x4]
    ldr r0, [r0, #0x20]
    and lr, lr, #0x1
    mla r3, lr, r3, r2
    mul r2, r0, ip
    add r3, r3, #0x30
    ldr r3, [r3, r2]
    ldr ip, _LIT4
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    ldr ip, [ip, r0, lsl #0x2]
    add r2, r2, r3, lsr #0x1f
    cmp ip, r2
    bne .L_2e4
    mov r2, ip, lsl #0x2
    ldrh r1, [r1, r2]
    ldr r2, _LIT5
    ldr r2, [r2, r0, lsl #0x2]
    mov r0, r1, lsl #0x11
    cmp r2, r0, lsr #0x1e
    beq .L_2ec
.L_2e4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_2ec:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d0170
_LIT4: .word data_ov002_022cd408
_LIT5: .word data_ov002_022cd41c
