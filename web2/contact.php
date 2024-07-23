<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta title="description" content="this is a conact page">
    <link rel="stylesheet" href="css/contact.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css ">
    <title>Contact Us | Eluda Care</title>
</head>

<body>
    <div class="content">
        <ul>
            <li>
                <a href="index.html">home</a>
            </li>
            <li>
                <a href="dentist.html" title=" visit our docotors" target="_blank">dentist </a>
            </li>
            <li>
                <a href="About us.html" title=" read anout us" target="_blank">about us</a>
            </li>
            <li>
                <a href="services.html" title="visit our services" target="_blank">services</a>
            </li>
            <li>
                <a href="pricing.html" title=" our pricing" target="_blank">pricing</a>
            </li>

            <li>
                <a href="contact.html" title="contact us" target="blank" class="contactusactive">Contact us</a>
            </li>

        </ul>
        </ul>
        <div class="log">
            <a href="Login.html" id="login" target="_blank"><i class="fa-solid fa-user "></i> Login</a>

        </div>
    </div>

    <div class="thefirst">
        <div class="contact">
            <h1>contact us</h1>
            <p>in this home you can find all information about us you can call us</p>

        </div>
    </div>
    <div class="thesecond">
        <div class="card1">
            <i class="fa-solid fa-phone fa-2x"></i>
            <h2>phone</h2>
            <h3>01093163715</h3>
        </div>
        <div class="card2">
            <i class="fa-solid fa-envelope fa-2x"></i>
            <h2>e-mail</h2>
            <h3>mrefaay271@gamil.com</h3>
        </div>
        <div class="card3">
            <i class="fa-solid fa-location-dot fa-2x"></i>
            <h2>loction</h2>
            <h3>Egypt-elqulbuia-banha</h3>
        </div>
    </div>
    <div class="thethird">

        <form id="form" method="post" action="contact.php">
            <div id="head">
                <h1> text us</h1>
            </div>
            <div class="colums">
                <div class="colum1">

                    <div>
                        <label for="name">full name<span>*</span></label>
                        <br>
                        <input type="text" name="name" id="name" maxlength="50" required placeholder="Enter your name">
                    </div>
                    <br>
                    <div>
                        <label for="phone"> phone number<span>*</span></label>
                        <br>
                        <input type="password" id="phone" name="phone" maxlength="11" placeholder="Your phone numer">
                    </div>
                    <br>

                </div>
                <br>

                <div class="colum2">

                    <div>
                        <label for="address ">email address<span>*</span></label>
                        <br>
                        <input type="email" id="address" name=" address" placeholder="mrefaay271@gamil.com">
                    </div>
                    <br>
                    <div>
                        <label for="message" class="message">message</label><br>

                        <textarea id="mesaage" name="message" maxlength="150" placeholder="message"></textarea>
                    </div>
                    <div class="send">
                        <input type="reset" value="delete" id="delete">

                        <input type="submit" value="send" id="send">

                    </div>
                </div>

            </div>




    </div>
    <br>




    </form>
    </div>
    <div class="footer">
        <p>Copyright &copy;2022 All rights reserved | This template is made with<i class="fa-solid fa-heart"></i><a
                href="#">by BFCAI TEAM</a></p>
    </div>
</body>

</html>

