; func_020a1038 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9760
        .extern data_021a981c
        .extern func_0209e430
        .extern func_020a10f0
        .global func_020a1038
        .arm
func_020a1038:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, #0x0
    ldr r2, _LIT0
    mov r3, r6
    ldr r1, _LIT1
.L_18:
    ldr r0, [r2]
    mla r5, r6, r1, r0
    add r0, r5, #0x1000
    ldrb r0, [r0, #0xd52]
    cmp r0, #0x0
    addne r0, r5, #0x1d00
    strneh r3, [r0, #0x4a]
    add r0, r6, #0x1
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
    cmp r6, #0x10
    bcc .L_18
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0]
    mov r6, #0x1
    ldr r5, _LIT3
.L_5c:
    mov r0, r4
    mov r1, r6
    bl func_0209e430
    cmp r0, #0x0
    beq .L_8c
    ldrh r1, [r0]
    cmp r1, r5
    beq .L_8c
    cmp r1, #0x0
    beq .L_8c
    mov r1, r6
    bl func_020a10f0
.L_8c:
    add r0, r6, #0x1
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
    cmp r6, #0xf
    bls .L_5c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a981c
_LIT1: .word 0x000005d4
_LIT2: .word data_021a9760
_LIT3: .word 0x0000ffff
