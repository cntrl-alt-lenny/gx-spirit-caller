; func_02088538 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a512c
        .extern func_020923d8
        .extern func_020927e4
        .global func_02088538
        .arm
func_02088538:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r6, _LIT0
    add r5, sp, #0x4
    mov r4, #0x1
.L_94:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_020923d8
    ldr r7, [sp, #0x4]
    cmp r7, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r7, #0xc]
    ldr r1, [r7, #0x4]
    bl func_020927e4
    ldr r0, [r7, #0x10]
    ldr r1, [r7, #0x4]
    bl func_020927e4
    ldr ip, [r7]
    ldr r0, [ip, #0x38]
    str r0, [sp]
    ldr r0, [r7, #0xc]
    ldr r1, [r7, #0x10]
    ldr r2, [r7, #0x4]
    ldr r3, [ip, #0x8]
    ldr ip, [ip, #0x34]
    blx ip
    b .L_94
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021a512c
