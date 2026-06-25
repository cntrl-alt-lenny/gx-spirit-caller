; func_02062d14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061364
        .extern func_02062df8
        .extern func_02062e78
        .global func_02062d14
        .arm
func_02062d14:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    add r3, sp, #0x0
    mov r1, #0x1
    mov r2, #0x27
    mov r5, r0
    bl func_02062e78
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [sp]
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, pc}
    mov r1, r4
    add r0, r5, #0x50
    mov r2, #0x20
    bl func_02061364
    mov r0, r5
    bl func_02062df8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
