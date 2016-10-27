my-little-overlay
=================

A collection of things I did not find in portage.

Just dump this into /etc/layman/overlays/my-little-overlay.xml and you are set:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE repositories SYSTEM "/dtd/repositories.dtd">
    <repositories xmlns="" version="1.0">
      <repo quality="experimental" status="unofficial">
        <name><![CDATA[my-little-overlay]]></name>
        <description lang="en"><![CDATA[Overlay with some stuff I didn't find in portage]]></description>
        <homepage>https://github.com/twisted-pear/my-little-overlay</homepage>
        <owner type="person">
          <email>twisted_pear@twstd.neomailbox.ch</email>
          <name><![CDATA[twisted_pear]]></name>
        </owner>
        <source type="git">https://github.com/twisted-pear/my-little-overlay.git</source>
      </repo>
    </repositories>
