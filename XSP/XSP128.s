*==========================================================================
*
*	128 �����[�h�E�\�[�e�B���O���[�`��
*
*==========================================================================

					* a0.l = �����p�o�b�t�@�Ǘ��\����
	movea.l	div_buff(a0),a1		* a1.l = #���X�^�����o�b�t�@A

					*---------------------------------------
					* d0.l = 
					* d1.l = 
					* d2.w = 
					* d3.w = 
					* d4.w = 
					* d5.w = 
					* d6.l = 
					* d7.w = �A���� dbcc �J�E���^
					*---------------------------------------
					* a0.l = ���o�b�t�@�X�L���� & �`�F�C���X�L����
					* a1.l = �]����X�L����
					* a2.l = 
					* a3.l = 
					* a4.l = 
					* a5.l = 
					* a6.l = 
					* a7.l = �`�F�C���擪���
					*---------------------------------------

	move.l	(a7)+,a0		* PR ���Ƃ̐擪�A�h���X
	move.w	CHAIN_OFS(a0),d7	* �A�����i���̂܂� dbcc �J�E���^�Ƃ��Ďg����j
	bmi.b	SORT_128_END		* �����Ȃ�A���������i�I�_�j�Ȃ�I��

*-------[ �\�[�e�B���O�������[�v ]
SORT_128_LOOP_:				* ���[�v 2 �{�W�J
	asr.w	#1,d7
	bcc.b	@F			* ��v�f���̏ꍇ�� 1 �X�L�b�v

SORT_128_LOOP:
	move.l	(a0)+,(a1)+		* x,y �]��
	move.l	(a0)+,(a1)+		* cd,pr �]��
@@:
	move.l	(a0)+,(a1)+		* x,y �]��
	move.l	(a0)+,(a1)+		* cd,pr �]��
	dbra	d7,SORT_128_LOOP

	movea.l	CHAIN_OFS-4(a0),a0	* ���� PR ���A�h���X
	move.w	CHAIN_OFS(a0),d7	* �A�����i���̂܂� dbcc �J�E���^�Ƃ��Ďg����j
	bpl.b	SORT_128_LOOP_		* �A���� >= 0 �Ȃ瑱�s

	*-------[ PR �ύX ]
		move.l	(a7)+,a0		* ���� PR �̐擪�A�h���X
		move.w	CHAIN_OFS(a0),d7	* �A�����i���̂܂� dbcc �J�E���^�Ƃ��Ďg����j
		bpl.b	SORT_128_LOOP_		* �A���� >= 0 �Ȃ瑱�s

SORT_128_END:


*--------------------------------------------------------------------------
*
*	�ő� 128 �����[�h �\�[�g�㏈��
*
*--------------------------------------------------------------------------

	move.l	write_struct(pc),a0		* a0.l = �����p�o�b�t�@�Ǘ��\����
	suba.l	div_buff(a0),a1			* a1.l = �g�p�X�v���C�g�� x 8
	move.w	a1,d0
	move.w	d0,buff_sp_total(a0)		* �o�b�t�@�i���o�[�� �X�v���C�g�� x 8 ���߂ĕۑ�




