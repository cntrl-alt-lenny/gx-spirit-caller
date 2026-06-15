; func_02062c74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020613d8
        .extern func_02062e6c
        .extern func_02062eec
        .global func_02062c74
        .arm
func_02062c74:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r3
    mov r6, r1
    mov r5, r2
    add r3, sp, #0x0
    add r2, r4, #0x27
    mov r1, #0x3
    mov r7, r0
    bl func_02062eec
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [sp]
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r1, r6
    add r0, r7, #0x50
    mov r2, #0x20
    bl func_020613d8
    mov r1, r5
    mov r2, r4
    add r0, r7, #0x50
    bl func_020613d8
    mov r0, r7
    bl func_02062e6c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
