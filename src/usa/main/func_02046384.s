; func_02046384 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_0204664c
        .extern func_02049068
        .global func_02046384
        .arm
func_02046384:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r0
    mov r4, r1
    bne .L_30
    ldr r1, _LIT0
    mov r0, #0x3
    ldr r1, [r1]
    str r4, [r1, #0x64]
    bl func_0204664c
    bl func_02049068
    b .L_38
.L_30:
    mov r0, #0x0
    bl func_0204664c
.L_38:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r3, [r0, #0x70]
    cmp r3, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r2, [r0, #0x74]
    mov r0, r5
    mov r1, r4
    blx r3
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219da0c
