; func_02062aec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02062e6c
        .extern func_02062eec
        .global func_02062aec
        .arm
func_02062aec:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r1, #0x7
    add r3, sp, #0x0
    mov r2, r1
    mov r4, r0
    bl func_02062eec
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [sp]
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_02062e6c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
