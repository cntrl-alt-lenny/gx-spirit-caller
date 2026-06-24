; func_020a39cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9818
        .extern func_0209ef3c
        .extern func_020a34e8
        .global func_020a39cc
        .arm
func_020a39cc:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x508]
    bl func_0209ef3c
    mov r4, r0
    mov r1, r4
    mov r0, #0x1
    bl func_020a34e8
    cmp r4, #0x2
    moveq r4, #0x0
    mov r0, r4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a9818
