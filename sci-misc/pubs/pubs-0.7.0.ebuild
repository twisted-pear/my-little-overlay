EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )

inherit distutils-r1 flag-o-matic

DESCRIPTION="Your bibliography on the command line"
HOMEPAGE="https://github.com/pubs/pubs/ https://pypi.org/project/pubs/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/bibtexparser[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
	"
DEPEND="${RDEPEND} dev-python/setuptools[${PYTHON_USEDEP}]"
