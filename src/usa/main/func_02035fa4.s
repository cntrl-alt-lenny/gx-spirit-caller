; func_02035fa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern func_02037c04
        .extern func_0203ab4c
        .global func_02035fa4
        .arm
func_02035fa4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x34]
    ldr r3, _LIT0
    mov r0, r0, lsl #0x10
    ldr r2, [r3, #0x34]
    mov r1, r0, lsr #0x10
    mov r0, #0xc
    mla r0, r1, r0, r2
    ldrb r0, [r0, #0x1]
    movs r0, r0, asr #0x4
    beq .L_b94
    ldrsh r0, [r3, #0x8]
    sub r0, r0, #0x1
    strh r0, [r3, #0x8]
    ldrsh r0, [r3, #0x8]
    cmp r0, #0x0
    bgt .L_b94
    mov r0, #0x0
    mov r1, #0x7f
    mov r2, #0x8
    strh r0, [r3, #0x8]
    bl func_02037c04
.L_b94:
    ldr r0, [r4]
    bl func_0203ab4c
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219b200
