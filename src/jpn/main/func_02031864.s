; func_02031864 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe37c
        .extern data_0219acd8
        .extern data_0219acec
        .extern data_0219b19c
        .extern func_02031850
        .extern func_02034704
        .global func_02031864
        .arm
func_02031864:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r5, _LIT2
    bl func_02034704
    ldr r6, _LIT3
    mov r4, #0x0
.L_1c:
    mov r0, r5
    bl func_02031850
    add r0, r5, #0x30
    bl func_02031850
    ldrb r0, [r6], #0x1
    add r4, r4, #0x1
    cmp r4, #0xc
    str r0, [r5, #0x60]
    add r5, r5, #0x64
    blt .L_1c
    ldr r0, _LIT4
    bl func_02031850
    ldr r0, _LIT5
    mov r1, #0x1
    str r1, [r0, #0x4]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219acd8
_LIT1: .word 0x000004f4
_LIT2: .word data_0219acec
_LIT3: .word data_020fe37c
_LIT4: .word data_0219b19c
_LIT5: .word data_0219acd8
