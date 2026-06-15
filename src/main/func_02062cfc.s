; func_02062cfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020613d8
        .extern func_02062e6c
        .extern func_02062eec
        .global func_02062cfc
        .arm
func_02062cfc:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r1
    mov r4, r2
    add r3, sp, #0x0
    mov r1, #0x2
    mov r2, #0x47
    mov r6, r0
    bl func_02062eec
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [sp]
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    mov r1, r5
    add r0, r6, #0x50
    mov r2, #0x20
    bl func_020613d8
    mov r1, r4
    add r0, r6, #0x50
    mov r2, #0x20
    bl func_020613d8
    mov r0, r6
    bl func_02062e6c
    cmp r0, #0x0
    ldrne r1, [r6, #0x88]
    moveq r0, #0x0
    movne r0, #0x1
    strne r1, [r6, #0x8c]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
