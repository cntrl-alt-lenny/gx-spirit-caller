; func_020197ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b5b80
        .extern func_02019604
        .extern func_0201a170
        .global func_020197ac
        .arm
func_020197ac:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r0, _LIT0
    rsb r1, r4, r4, lsl #0x3
    add r0, r0, r1
    ldrsb r6, [r0, #0x3]
    cmp r6, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_02019604
    mov r5, r0
    mov r0, #0xb
    bl func_0201a170
    add r1, r6, r5
    add r0, r1, r0
    cmp r0, #0x64
    movge r0, #0x64
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_02019604
    mov r4, r0
    mov r0, #0xb
    bl func_0201a170
    add r1, r6, r4
    add r0, r1, r0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020b5b80
