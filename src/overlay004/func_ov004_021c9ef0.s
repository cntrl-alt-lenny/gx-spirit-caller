; func_ov004_021c9ef0 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern func_02001d0c
        .extern func_02001e94
        .extern func_02004f58
        .extern func_020054a4
        .extern func_0202c0c0
        .extern func_0208df0c
        .extern func_0208e1cc
        .extern func_02094504
        .global func_ov004_021c9ef0
        .arm
func_ov004_021c9ef0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl func_0208df0c
    mov r5, r0
    ldr r0, _LIT0
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001d0c
    add r1, r5, #0x820
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    cmp r4, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_0202c0c0
    mov r1, #0xc
    mov r4, r0
    bl func_020054a4
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    mov r2, #0x0
    str r2, [sp]
    mov ip, #0xc
    ldr r0, _LIT0
    mov r1, r4
    add r2, r5, #0x820
    rsb r3, r3, #0x80
    str ip, [sp, #0x4]
    bl func_02004f58
    bl func_0208e1cc
    add r1, r0, #0x580
    ldr r0, _LIT0
    mov r2, #0x41
    mov r3, #0x0
    bl func_02001e94
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02102c90
