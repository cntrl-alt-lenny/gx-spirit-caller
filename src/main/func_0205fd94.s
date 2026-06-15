; func_0205fd94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021011bc
        .extern data_021011c4
        .extern func_0205fe18
        .extern func_020602c4
        .extern func_020aac84
        .global func_0205fd94
        .arm
func_0205fd94:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x54
    mov r4, r1
    mov r5, r0
    mov r0, r3
    ldr r1, _LIT0
    add r2, sp, #0x4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    addeq sp, sp, #0x54
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, _LIT1
    add ip, sp, #0x4c
    add r0, sp, #0x4
    add r2, sp, #0x44
    add r3, sp, #0x48
    str ip, [sp]
    bl func_020aac84
    cmp r0, #0x3
    addne sp, sp, #0x54
    ldmneia sp!, {r4, r5, pc}
    mov ip, #0x0
    add r1, sp, #0x44
    mov r0, r5
    mov r2, r4
    mov r3, #0x2
    str ip, [sp]
    bl func_0205fe18
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021011bc
_LIT1: .word data_021011c4
