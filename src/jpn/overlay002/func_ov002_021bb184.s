; func_ov002_021bb184 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .global func_ov002_021bb184
        .arm
func_ov002_021bb184:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r5, r2
    mov r7, r0
    mov r6, r1
    beq .L_514
    and r0, r5, #0x1
    cmp r0, #0x0
    mov r4, #0x0
    bgt .L_4ec
    mov r0, r6
    mov r1, r7
    sub r2, r4, #0x1
    bl func_ov002_021bad9c
    add r4, r4, r0
.L_4ec:
    and r0, r5, #0x2
    cmp r0, #0x0
    bgt .L_50c
    mov r1, r7
    rsb r0, r6, #0x1
    mvn r2, #0x0
    bl func_ov002_021bad9c
    add r4, r4, r0
.L_50c:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_514:
    bl func_ov002_021baf88
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
