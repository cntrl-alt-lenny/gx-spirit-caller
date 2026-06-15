; func_02088dd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5204
        .extern data_021a5208
        .extern data_021a520c
        .extern data_021a522c
        .extern data_021a5340
        .extern data_021a5800
        .extern func_02088620
        .extern func_020919d8
        .extern func_02091d24
        .extern func_02092614
        .global func_02088dd8
        .arm
func_02088dd8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, pc}
    ldr r3, _LIT1
    mov ip, #0x0
    ldr r0, _LIT2
    ldr r1, _LIT3
    mov r2, #0x8
    str ip, [r3]
    bl func_02092614
    mov r0, #0x400
    str r0, [sp]
    ldr r0, _LIT4
    ldr r1, _LIT5
    ldr r3, _LIT6
    mov r2, #0x0
    str r4, [sp, #0x4]
    bl func_02091d24
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r0, _LIT4
    str r2, [r1]
    bl func_020919d8
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a5204
_LIT1: .word data_021a5208
_LIT2: .word data_021a520c
_LIT3: .word data_021a522c
_LIT4: .word data_021a5340
_LIT5: .word func_02088620
_LIT6: .word data_021a5800
