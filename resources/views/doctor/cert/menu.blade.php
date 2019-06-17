<style>
    .dropdown>ul{display: none;}
    .dropdown:hover ul{
        display: block;
    }
    .notification {
        position:absolute;
        top: 12px;
        font-size:.7em;
        background:red;
        color:white;
        width:18px;height:18px;
        text-align:center;
        line-height:18px;
        border-radius:50%;
        box-shadow:0 0 1px #333;
        display: none;
    }
</style>

<li {{{ (Request::is('index') ? 'class=active' : '') }}}>
    <a href="/admin/index"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> nghiệp vụ chuyên môn</a>
</li>


<li class="dropdown">
    <a ><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> Chứng thư gốc</a>
    <ul>
        <li {{{ (Request::is('register-request-index') ? 'class=active' : '') }}}>
            <a href="{{ route('register-request-index') }}"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> Danh sách</a>
        </li>
        <li {{{ (Request::is('register-request-create') ? 'class=active' : '') }}}>
            <a href="{{ route('register-request-create') }}"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> cấp phát</a>
        </li>
    </ul>
<li>

<li class="dropdown">
    <a ><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> Giấy giới thiệu</a>
    <ul>
        <li {{{ (Request::is('intro-requests/index') ? 'class=active' : '') }}}>
            <a href="{{ route('intro-requests-index') }}"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> Danh sách</a>
        </li>
        <li {{{ (Request::is('intro-requests/create') ? 'class=active' : '') }}}>
            <a href="{{ route('intro-requests-create') }}"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> Cấp phát</a>
        </li>
    </ul>
<li>

<li {{{ (Request::is('cert/chek') ? 'class=active' : '') }}}>
    <a href="{{ route('check') }}"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> Kiểm tra chứng thư</a>
</li>

