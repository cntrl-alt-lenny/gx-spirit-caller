; func_0203f6cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe550
        .extern func_0203f590
        .extern func_02094688
        .extern func_020a7440
        .global func_0203f6cc
        .arm
func_0203f6cc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r1
    add r1, sp, #0x0
    bl func_0203f590
    ldr r1, _LIT0
    add r0, sp, #0x0
    mov r2, #0x8
    bl func_020a7440
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, pc}
    add r0, sp, #0x8
    mov r1, r4
    mov r2, #0xa
    bl func_02094688
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
_LIT0: .word data_020fe550
