<?php
use \AcceptanceTester;
use Page\XEURLBuilder as XEURL;

class AdminDocumentCest
{
	public function _before(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->amOnPage('/');
		if ($I->loadSessionSnapshot('admin')) return;
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
	}

	public function _after(AcceptanceTester $I)
	{
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_001(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_001");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->see('Welcome mobile XE');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_002(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_002");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->see('임시 저장 글입니다.');
		$I->click("공개");
		$I->dontsee('임시 저장 글입니다.');
		$I->click("비밀");
		$I->see('비밀글');
		$I->click("임시");
		$I->see('임시 저장 글입니다.');
		$I->click("신고 목록");
		$I->see('신고당한 글입니다.');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_003(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_003");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->seeElement('.x_btn-group .x_btn.modalAnchor.xe-modal-window.x_disabled');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList','page',2));
		$I->seeElement('.x_btn-group .x_btn.modalAnchor.xe-modal-window.x_disabled');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_004(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_004");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "제목");
		$I->fillField("search_keyword", "Board1");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('Board1');
		$I->dontsee('Board2');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_005(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_005");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "내용");
		$I->fillField("search_keyword", "Board2");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('Board2');
		$I->dontsee('Board1');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_006(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_006");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "아이디");
		$I->fillField("search_keyword", "user_id");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반글');
		$I->dontsee('노티스');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_007(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_007");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "회원 번호");
		$I->fillField("search_keyword", "268");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반글');
		$I->dontsee('노티스');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_008(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_008");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "사용자 이름");
		$I->fillField("search_keyword", "user_name");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반글');
		$I->dontsee('노티스');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_009(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_009");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "닉네임");
		$I->fillField("search_keyword", "nick_name");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반글');
		$I->dontsee('노티스');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_010(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_010");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "이메일");
		$I->fillField("search_keyword", "email@domain.com");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('일반글');
		$I->dontsee('노티스');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_011(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_011");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "홈페이지");
		$I->fillField("search_keyword", "http://example.com/");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('Board1');
		$I->see('일반글');
		$I->dontsee('Board2');
		$I->dontsee('노티스');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_012(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_012");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "공지사항");
		$I->fillField("search_keyword", "Y");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('노티스');
		$I->dontsee('일반글');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_013(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_013");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "비밀글");
		$I->fillField("search_keyword", "Y");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('비밀글');
		$I->dontsee('노티스');
		$I->dontsee('일반글');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_014(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_014");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "태그");
		$I->fillField("search_keyword", "board2");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('Board2');
		$I->dontsee('Board1');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_015(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_015");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "조회 수 (이상)");
		$I->fillField("search_keyword", "100");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('많이 본 글');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_016(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_016");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "추천 수 (이상)");
		$I->fillField("search_keyword", "10");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('대단한 글');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_017(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_017");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "비추천 수 (이상)");
		$I->fillField("search_keyword", "5");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('나쁜 글');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_018(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_018");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "댓글 수 (이상)");
		$I->fillField("search_keyword", "5");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('토론');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_019(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_019");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "트랙백 수 (이상)");
		$I->fillField("search_keyword", "5");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('공격받은 문서');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_020(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_020");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "첨부파일 수 (이상)");
		$I->fillField("search_keyword", "5");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('파일이 많은 글');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_021(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_021");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "등록일");
		$I->fillField("search_keyword", "19800101");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('오래된 글');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_022(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_022");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "최근 수정일");
		$I->fillField("search_keyword", "20100101");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('방금 수정된 글');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_023(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_023");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "IP 주소");
		$I->fillField("search_keyword", "192.168.0.1");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('출처 불명 글');
	}
	
	/**
	* @group admin-document
	* @group admin-document-001
	*/
	public function admin_document_001_024(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_001_024");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		$I->selectOption("select[name=\"search_target\"]", "제목");
		$I->fillField("search_keyword", "Board1");
		$I->click("button.x_btn.x_btn-inverse");
		$I->see('Board1');
		$I->dontsee('Board2');
		$I->click('취소');
		$I->dontSeeInField('search_keyword', 'Board1');
	}
	
	/**
	* @group admin-document
	* @group admin-document-002
	*/
	public function admin_document_002_001(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_002_001");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));
		
		$I->click("(//a[contains(text(),'휴지통')])[2]");
		$I->see('선택한 문서가 없습니다.');
		$I->click('.x_btn.x_btn-inverse.x_pull-right.x_btn-primary._ok');
		
		$I->click("//a[contains(text(),'삭제')]");
		$I->see('선택한 문서가 없습니다.');
		$I->click('.x_btn.x_btn-inverse.x_pull-right.x_btn-primary._ok');
		
		$I->click("//a[contains(text(),'이동')]");
		$I->see('선택한 문서가 없습니다.');
		$I->click('.x_btn.x_btn-inverse.x_pull-right.x_btn-primary._ok');
		
		$I->click("//a[contains(text(),'복사')]");
		$I->see('선택한 문서가 없습니다.');
		$I->click('.x_btn.x_btn-inverse.x_pull-right.x_btn-primary._ok');
	}

	/**
	 * @group admin-document
	 * @group admin-document-002
	 */
	public function admin_document_002_002(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_002_002");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));

		$I->click("(//input[@name='cart'])[3]");
		$I->click("(//a[contains(text(),'휴지통')])[2]");
		$I->click("//form[@id='manageForm']/div[3]/button");

		$I->dontSee('휴지통으로 보내질 글입니다.');
	}

	/**
	 * @group admin-document
	 * @group admin-document-002
	 */
	public function admin_document_002_003(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_002_003");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));

		$I->click("(//input[@name='cart'])[3]");
		$I->click("//a[contains(text(),'삭제')]");
		$I->click("//form[@id='manageForm']/div[3]/button");

		$I->dontSee('삭제될 글입니다.');
	}

	/**
	 * @group admin-document
	 * @group admin-document-002
	 */
	public function admin_document_002_004(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_002_004");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));

		$I->click("(//input[@name='cart'])[2]");
		$I->click("//a[contains(text(),'이동')]");
		$I->executeJS('jQuery("input[name=\'module_srl\']").attr("value",263);');
		$I->click("//form[@id='manageForm']/div[3]/button");

		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board1'));
		$I->dontSee('게시판2로 가고 싶은 글');

		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board2'));
		$I->see('게시판2로 가고 싶은 글');
		$I->click('게시판2로 가고 싶은 글');

		$I->see('보내드립니다.');
		$I->see('감사합니다');
	}

	/**
	 * @group admin-document
	 * @group admin-document-002
	 */
	public function admin_document_002_005(AcceptanceTester $I)
	{
		$I->wantTo("admin_document_002_005");
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispDocumentAdminList'));

		$I->click("input[name=cart]");
		$I->click("//a[contains(text(),'복사')]");
		$I->executeJS('jQuery("input[name=\'module_srl\']").attr("value",263);');
		$I->click("//form[@id='manageForm']/div[3]/button");

		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board1'));
		$I->see('쌍둥이 게시글');
		$I->click('쌍둥이 게시글');

		$I->see('안보이는데요?');
		$I->see('기분 탓입니다.');

		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board2'));
		$I->see('쌍둥이 게시글');
		$I->click('쌍둥이 게시글');

		$I->see('안보이는데요?');
		$I->see('기분 탓입니다.');
	}
}
