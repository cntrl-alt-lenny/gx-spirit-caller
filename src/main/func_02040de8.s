; func_02040de8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020aaf40
        .global func_02040de8
        .arm
func_02040de8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, #0x0
.L_76c:
    add r0, r6, r4, lsl #0x3
    add r0, r0, #0x1000
    ldr r1, [r0, #0xa34]
    cmp r1, #0x0
    beq .L_7a8
    mov r0, r5
    bl func_020aaf40
    cmp r0, #0x0
    addeq r0, r6, r4, lsl #0x3
    addeq r0, r0, #0x1000
    ldreq r0, [r0, #0xa38]
    ldmeqia sp!, {r4, r5, r6, pc}
    add r4, r4, #0x1
    cmp r4, #0x20
    blt .L_76c
.L_7a8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
