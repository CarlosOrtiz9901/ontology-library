<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="LibraryOntology.Views.PublicViews.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="css/slick.css" />
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="css/style.css" />

    <title>Bibloteca Plus</title>
    <meta name="keywords" content="libro, biblioteca, actor, literatura, genero" />
    <meta name="description" content="pagina para comprar libros best sellers, con contenido académico, de comercio electrónico que son excelentes alternativas debido a que te ofrecen una gran variedad semanticamente" />
    <meta name="author" content="CARLOS Y LIZETH" />
    <meta name="coypiright" content="BiblotecaPlus INC" />
    <meta name="robots" content="index" />
    <meta name="robots" content="follow" />

</head>
<body>
    <form id="form1" runat="server">
        <!-- HEADER -->
        <header id="main-header" itemscope="itemscope" itemtype="http://schema.org/LocalBusiness" itemref="main-header name_id _image1 _image2 _image3 _image4 _image5 _image6  _telephone1 _email1  _postalCode3 _postalCode1 _address1">
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container" >
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i><span >+57 313-301-1867</span></a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i><span >biblotecaplus@email.com</span></a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i><span >18001</span> Florencia Caquetá <span >(Colombia)</span></a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="#">
                            <h6 id="name_id" itemprop="name">Bibloteca Plus</h6>
                        </a></li>
                        <li><a href="#"><i class="fa fa-user-o"></i>Mi Cuenta</a></li>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="#" class="logo">
                                    <img src="img2/Logo1.png" alt="Logo" itemprop="image" id="_image1" width="50" />
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6" style="height: 70px;">
                            <div class="header-search">
                                <div>
                                    <asp:DropDownList ID="DDL_PROPERTY" runat="server" CssClass="input-select" AppendDataBoundItems="true" Style="margin-right: -4px; border-radius: 40px 0px 0px 40px; height: 32px; width: 33%;">
                                        <asp:ListItem Selected="True" Value="Propiedad">Propiedad</asp:ListItem>
                                        <asp:ListItem Selected="false" Value="Nombre">Nombre</asp:ListItem>
                                        <asp:ListItem Selected="false" Value="Tipo">Género literario</asp:ListItem>
                                        <asp:ListItem Selected="false" Value="Sipnosis">Sinopsis</asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:TextBox CssClass="input" runat="server" ID="TB_BOOK" Style="width: calc(100% - 40%); margin-right: -4px; height: 32px; width: 40%;" placeholder="Busca un libro en específico..." />
                                    <asp:Button runat="server" CssClass="search-btn" ID="BTN_SEARCH" OnClick="BTN_SEARCH_CLICK" Style="height: 40px; width: 100px; background: #D10024; color: #FFF; font-weight: 700; border: none; border-radius: 0px 40px 40px 0px; height: 32px;" Text="Buscar"></asp:Button>
                                </div>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->
                                <div>
                                    <a href="#">
                                        <i class="fa fa-heart-o"></i>
                                        <span>Lista de deseos</span>
                                        <div class="qty">2</div>
                                    </a>
                                </div>

                                <div>
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Tu carrito</span>
                                        <div class="qty">3</div>
                                    </a>
                                </div>
                                <!-- /Wishlist -->

                                <!-- Cart -->
                                <%--  <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Tu carrito</span>
                                        <div class="qty">3</div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list">
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/product01.png" alt="_2" itemprop="image" id="_image2" />
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                    <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>

                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/product02.png" alt="_3" itemprop="image" id="_image3" />
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                    <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>
                                        </div>
                                        <div class="cart-summary">
                                            <small>3 Item(s) selected</small>
                                            <h5>SUBTOTAL: $2940.00</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="#">View Cart</a>
                                            <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>--%>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <%--    <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>--%>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <%-- <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#">Hot Deals</a></li>
                        <li><a href="#">Categories</a></li>
                        <li><a href="#">Laptops</a></li>
                        <li><a href="#">Smartphones</a></li>
                        <li><a href="#">Cameras</a></li>
                        <li><a href="#">Accessories</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>--%>
        <!-- /NAVIGATION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container" id="autor_main" itemtype="http://schema.org/Library" itemref="autor_main name">
                <!-- row -->
                <div class="row" vocab="https://schema.org/" typeof="Library">
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Autores Destacados</h3>
                        </div>
                    </div>
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                    <asp:Repeater ID="Rep_Aurhor_Three" runat="server">
                        <ItemTemplate>

                            <div class="col-md-4 col-xs-6">
                                <div class="shop" style="height: 270px;">
                                    <div class="shop-img">
                                        <figure>
                                            <a href='<%# Eval("Imagen") %>' data-fancybox="images">
                                                <asp:Image runat="server" ImageUrl='<%# Eval("Imagen") %>' itemprop="image" Style="width: 100%;" />
                                            </a>
                                        </figure>
                                    </div>
                                    <div class="shop-body">
                                        <h5 style="color: #FFF" itemprop="name">AUTOR<br />
                                            <%# Eval("Nombre") %></h5>
                                        <a href="#" class="cta-btn">Leer más <i class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Nuevos Libros</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active" itemscope="itemscope" itemtype="http://schema.org/Library" itemref="tab1 _literarygenre _name _pages _ratingValue">
                                    <div class="products-slick" data-nav="#slick-nav-1" vocab="https://schema.org/" typeof="Library">

                                        <asp:Repeater ID="Rep_Books" runat="server">
                                            <ItemTemplate>

                                                <div class="product">
                                                    <div class="product-img">
                                                        <asp:Image runat="server" ImageUrl='<%# Eval("Imagen") %>' itemprop="image" Style="width: 100%;" />
                                                        <div class="product-label">
                                                            <span class="new">NUEVO</span>
                                                            <%--<span class="sale">-30%</span>--%>
                                                        </div>
                                                    </div>
                                                    <div class="product-body">
                                                        <p class="product-category" id="_literarygenre" itemprop="literarygenre"><%# Eval("Tipo") %></p>
                                                        <h3 class="product-name" id="_name" itemprop="name"><a href="#"><%# Eval("Nombre") %></a></h3>
                                                        <h4 class="product-price" id="_pages" itemprop="pages">Páginas: <del class="product-old-price" style="text-decoration: none;"><%# Eval("Paginas").ToString().Split('^')[0] %></del></h4>
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div><span id="_ratingValue" itemprop="ratingValue"><%# Eval("Puntuacion").ToString().Split('^')[0] %></span></div>
                                                        <div class="product-btns">
                                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">añadir lista deseos</span></button>
                                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Vista rápida</span></button>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Añadir al carrito</button>
                                                    </div>
                                                </div>

                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row" style="text-transform: none;">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>
                            </ul>
                            <div>
                                <h2 itemprop="ratingValue">LIBRO MEJOR CALIFICADO CON <%=BEST_BOOK_SCORE %></h2>
                                <p itemprop="name"><%=BEST_BOOK_NAME %></p>
                            </div>
                            <div class="product-img">
                                <img src='<%=BEST_BOOK_URL %>' alt='_best_book' itemprop="image" id="_image_4" style="width: 10%;" />
                            </div>
                            <a class="primary-btn cta-btn" href="#">COMPRAR AHORA</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">MÁS VENDIDOS</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <asp:Repeater ID="Rep_Best_Sellers" runat="server">
                                            <ItemTemplate>

                                                <div class="product">
                                                    <div class="product-img">
                                                        <asp:Image runat="server" ImageUrl='<%# Eval("Imagen") %>' itemprop="image" Style="width: 100%;" />
                                                        <div class="product-label">
                                                            <%--<span class="new">NUEVO</span>--%>
                                                            <%--<span class="sale">-30%</span>--%>
                                                        </div>
                                                    </div>
                                                    <div class="product-body">
                                                        <p class="product-category" itemprop="literarygenre"><%# Eval("Tipo") %></p>
                                                        <h3 class="product-name" itemprop="name"><a href="#"><%# Eval("Nombre") %></a></h3>
                                                        <h4 class="product-price" itemprop="pages">Páginas: <del class="product-old-price" style="text-decoration: none;"><%# Eval("Paginas").ToString().Split('^')[0] %></del></h4>
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div><span itemprop="ratingValue"><%# Eval("Puntuacion").ToString().Split('^')[0] %></span></div>
                                                        <div class="product-btns">
                                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">añadir lista deseos</span></button>
                                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Vista rápida</span></button>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Añadir al carrito</button>
                                                    </div>
                                                </div>

                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Nuestros Clientes</h4>
                            <div class="section-nav">
                                <div id="slick-nav-3" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-3">
                            <asp:Repeater ID="Rep_Client" runat="server">
                                <ItemTemplate>

                                    <div>
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="./img/profile.png" alt="_5" id="_image5" itemprop="image" />
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">Cliente</p>
                                                <h3 class="product-name" itemprop="name"><a href="#"><%# Eval("Nombre") %></a></h3>
                                                <h4 class="product-price">Nacionalidad: <del class="product-old-price" style="text-decoration: none;"><%# Eval("Nacionalidad") %></del></h4>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>

                        </div>

                    </div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Autores Más Comprados</h4>
                            <div class="section-nav">
                                <div id="slick-nav-4" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-4">
                            <asp:Repeater ID="Rep_Author" runat="server">
                                <ItemTemplate>

                                    <div>
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <asp:Image runat="server" ImageUrl='<%# Eval("Imagen") %>' itemprop="image" Style="width: 100%;" />
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">Autor</p>
                                                <h3 class="product-name" itemprop="name"><a href="#"><%# Eval("Nombre") %></a></h3>
                                                <h4 class="product-price">Nacionalidad: <del class="product-old-price" style="text-decoration: none;"><%# Eval("Nacionalidad") %></del></h4>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="clearfix visible-sm visible-xs"></div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Editoriales</h4>
                            <div class="section-nav">
                                <div id="slick-nav-5" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-5">

                            <asp:Repeater ID="Rep_Editorial" runat="server">
                                <ItemTemplate>
                                    <div>
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="./img/editorial.png" alt="_6" id="_image6" itemprop="image" />
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">EDITORIAL</p>
                                                <h3 class="product-name" itemprop="name"><a href="#"><%# Eval("Nombre") %></a></h3>
                                                <h4 class="product-price">Nacionalidad: <del class="product-old-price" style="text-decoration: none;"><%# Eval("Nacionalidad") %></del></h4>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </div>

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        d
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Regístrese para el <strong>BOLETIN INFORMATIVO</strong></p>
                            <div style="padding: 10px">
                                <input class="input" type="email" placeholder="Ingresa tu correo electronico" style="width: 25%; height: 33px; margin-right: 0px; border-radius: 40px 0px 0px 40px; vertical-align: middle;" />
                                <button class="newsletter-btn" style="height: 40px; width: 100px; background: #D10024; color: #FFF; font-weight: 700; border: none; border-radius: 0px 40px 40px 0px; height: 32px; font-size: 11px;">
                                    <i class="fa fa-envelope" style="padding-right: 7px;"></i>Subscribe</button>
                            </div>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6" id="_address1" itemprop="address" itemscope="itemscope" itemtype="http://schema.org/PostalAddress" itemref="_postalCode3">
                            <div class="footer">
                                <h3 class="footer-title">Sobre Nosotros</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i><span id="_postalCode1" itemprop="postalCode">18001</span> - Florencia Caquetá <span itemprop="addressCountry">(Colombia)</span>, especificamente en la dirección <span itemprop="streetAddress">Cra 2F # 12-C35</span> <span itemprop="addressLocality">ABAS TURBAY</span> </a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i><span id="_telephone1" itemprop="telephone">3133011867</span></a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i><span id="_email1" itemprop="email">biblotecaplus@email.com</span></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">CATEGORIAS</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Las mejores ofertas</a></li>
                                    <li><a href="#">Accesorios</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">INFORMACIÓN</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Sobre nosotros</a></li>
                                    <li><a href="#">Contáctenos</a></li>
                                    <li><a href="#">Política de privacidad</a></li>
                                    <li><a href="#">Pedidos y Devoluciones</a></li>
                                    <li><a href="#">Términos y condiciones</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Mi Cuenta</a></li>
                                    <li><a href="#">Ver carrito</a></li>
                                    <li><a href="#">Lista de deseos</a></li>
                                    <li><a href="#">Seguimiento de mi pedido</a></li>
                                    <li><a href="#">Ayuda</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                Todos los derechos reservados | Esta plantilla está hecha <i class="fa fa-heart-o" aria-hidden="true"></i>por <a href="https://colorlib.com" target="_blank" style="color: yellow;">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
    </form>
</body>
</html>
